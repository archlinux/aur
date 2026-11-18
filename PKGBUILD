# Maintainer: Herbert Knapp Name <herbert.knapp edu.uni-graz.at>
pkgname=exact-audio-copy
pkgver=1.8
pkgrel=4
pkgdesc='A precise CD audio grabber for creating perfect quality rips using CD and DVD drives'
arch=('any')
url='https://www.exactaudiocopy.de/'
source=('eac.exe::https://www.exactaudiocopy.de/eac-1.8.exe')
sha512sums=('89822966d57f5f89d40cb8b4bf5c1e1e169983d5b4dfdfa4559dd2b69a49dc6234e3e336452ec9220530e5ed228f656a58c346950cd2ce84d8edc200e38bad4b')
license=('unknown')
depends=('wine' 'winetricks')
makedepends=('imagemagick' 'p7zip')

prepare() {
  _tmp=$(mktemp -d)
  cd ${_tmp}
  mkdir eac "$srcdir/eac/"
  cd eac
  7z x -aoa "$srcdir/eac.exe"
  chmod -R 755 .
  CYG_LATEST='https://web.archive.org/web/20240925225100if_/https://cygwin.com/snapshots/x86/cygwin1-20220301.dll.xz'
  curl -s ${CYG_LATEST} > cygwin1.dll.xz
  xz --decompress cygwin1.dll.xz
  mv cygwin1.dll CDRDAO/
  cp -r * "$srcdir/eac/"
  7z x EAC.exe
  magick .rsrc/1033/ICON/29.ico -thumbnail 128x128 -alpha on -background none -flatten "$srcdir/eac/eac.ico.128.png"
  rm -r ${_tmp}
}

package() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/opt"
  mv "$srcdir/eac" "$pkgdir/opt/exact-audio-copy"

  _launcher="$pkgdir/usr/bin/eac"
  cat > "${_launcher}" <<'EAC_LAUNCHER'
#!/bin/bash
set -u

OLD_WINEPREFIX="~/.exact-audio-copy"
export WINEPREFIX="$HOME/.local/share/wineprefixes/exact-audio-copy"
export WINEDEBUG="${WINEDEBUG:--all}"

[[ -d "${OLD_WINEPREFIX}" && ! -d "${WINEPREFIX}" ]] && mkdir -p $HOME/.local/share/wineprefixes && mv "${OLD_WINEPREFIX}"  "$HOME/.local/share/wineprefixes/"

eac_dir=$WINEPREFIX/eac
dosdevices=$WINEPREFIX/dosdevices
media_dir=$WINEPREFIX/media # empty drive roots for the optical drives
eac_key='HKCU\Software\AWSoftware\EACU\Extraction Options'
drives_key='HKLM\Software\Wine\Drives'

warn() {
	printf 'eac: %s\n' "$*" >&2
	if command -v notify-send >/dev/null; then
		notify-send -a 'Exact Audio Copy' 'Exact Audio Copy' "$*" >/dev/null 2>&1 &
	fi
}

# active). The prefix is only modified while it is idle.
server_running() {
	local dev ino
	read -r dev ino < <(stat -c '%d %i' -- "$WINEPREFIX" 2>/dev/null) || return 1
	[[ -S $(printf '/tmp/.wine-%d/server-%x-%x/socket' "$(id -u)" "$dev" "$ino") ]]
}

optical_drives() {
	lsblk -rndpo NAME,TYPE 2>/dev/null | awk '$2 == "rom" { print $1 }'
}

# Block devices that are not optical drives but that Wine would map as CD-ROMs.
fake_cdroms() {
	lsblk -rnpo NAME,TYPE,FSTYPE 2>/dev/null |
		awk '$2 != "rom" && ($3 == "iso9660" || $3 == "udf") { print $1 }'
}

# "<letter> <type>" for every value of HKLM\Software\Wine\Drives, read from
# system.reg, which is current because no wineserver is running.
reg_drive_types() {
	awk '
		/^\[/ { in_key = (tolower($0) ~ /^\[software\\\\wine\\\\drives\]/); next }
		in_key && match(tolower($0), /^"[a-z]:"="[^"]*"/) {
			s = tolower($0); print substr(s, 2, 1), substr(s, 7, RLENGTH - 7)
		}' "$WINEPREFIX/system.reg" 2>/dev/null
}

# Stored value of EAC's UseNativeSCSIInterface, e.g. "hex:00"; empty if unset.
eac_interface() {
	awk '
		/^\[/ { in_key = (tolower($0) ~ /^\[software\\\\awsoftware\\\\eacu\\\\extraction options\]/); next }
		in_key && tolower($0) ~ /^"usenativescsiinterface"=/ { sub(/^[^=]*=/, ""); print tolower($0); exit }
	' "$WINEPREFIX/user.reg" 2>/dev/null
}

free_letter() {
	local l
	for l in {d..y}; do
		[[ -e $dosdevices/$l: || -L $dosdevices/$l: || -L $dosdevices/$l:: ]] && continue
		printf '%s\n' "$l"
		return 0
	done
	return 1
}

choose_drive_mode() {
	local -a fake
	mode=${EAC_DRIVE_MODE:-auto}
	if [[ $mode == auto ]]; then
		mode=udisks
		mapfile -t fake < <(fake_cdroms)
		if ((${#fake[@]})); then
			mode=static
			printf 'eac: Wine would treat %s as CD drive(s) (ISO9660/UDF signature), hiding removable devices from Wine\n' "${fake[*]}" >&2
		fi
	fi
	if [[ $mode == static ]]; then
		export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/dev/null/no-system-bus
	fi
}

fix_prefix() {
	local dev l t flag
	local -a optical set_cdrom=() del_type=() iface=()
	local -A is_optical=() letter_of=() type_of=() cdrom_letter=()

	mapfile -t optical < <(optical_drives)
	((${#optical[@]})) || warn 'No CD/DVD drive found.'
	for dev in "${optical[@]}"; do
		is_optical[$dev]=1
		[[ -r $dev && -w $dev ]] || warn "No read/write access to $dev, EAC cannot use this drive."
	done

	# Keep device mappings only for optical drives that are present (one letter
	# per drive). Everything else is a leftover of an unplugged device or a
	# fake CD-ROM; udisks2 maps real removable devices again when needed.
	for l in {d..y}; do
		if [[ -L $dosdevices/$l:: ]]; then
			dev=$(readlink -f -- "$dosdevices/$l::")
			if [[ -n ${is_optical[$dev]:-} && -z ${letter_of[$dev]:-} ]]; then
				letter_of[$dev]=$l
			else
				rm -f -- "$dosdevices/$l::" "$dosdevices/$l:"
			fi
		elif [[ $(readlink -- "$dosdevices/$l:") == "$media_dir/"* ]]; then
			rm -f -- "$dosdevices/$l:"
		fi
	done

	# Map every optical drive, so it exists from the start of the session.
	for dev in "${optical[@]}"; do
		l=${letter_of[$dev]:-}
		if [[ -z $l ]]; then
			l=$(free_letter) || { warn "No free drive letter for $dev."; continue; }
			ln -s -- "$dev" "$dosdevices/$l::"
		fi
		if [[ ! -L $dosdevices/$l: ]]; then
			mkdir -p -- "$media_dir/${dev##*/}"
			ln -s -- "$media_dir/${dev##*/}" "$dosdevices/$l:"
		fi
		cdrom_letter[$l]=1
	done

	# Wine reads the drive types once per session, so changing them means
	# restarting the idle prefix before EAC starts.
	while read -r l t; do type_of[$l]=$t; done < <(reg_drive_types)
	for l in {d..y}; do
		[[ -L $dosdevices/$l: ]] || continue
		if [[ -n ${cdrom_letter[$l]:-} ]]; then
			[[ ${type_of[$l]:-} == cdrom ]] || set_cdrom+=("$l")
		elif [[ ${type_of[$l]:-} == cdrom ]]; then
			del_type+=("$l") # CD-ROM letter without a usable device
		fi
	done

	flag=$(eac_interface)
	case $flag in
	'' | hex:01 | dword:00000001) ;;
	dword:*) iface=(/t REG_DWORD /d 1) ;;
	*) iface=(/t REG_BINARY /d 01) ;;
	esac

	for l in "${set_cdrom[@]}"; do
		wine reg add "$drives_key" /v "$l:" /d cdrom /f >/dev/null
	done
	for l in "${del_type[@]}"; do
		wine reg delete "$drives_key" /v "$l:" /f >/dev/null
	done
	if ((${#iface[@]})); then
		wine reg add "$eac_key" /v UseNativeSCSIInterface "${iface[@]}" /f >/dev/null
	fi
	if ((${#set_cdrom[@]} + ${#del_type[@]})); then
		wineserver -k
		wineserver -w
	fi
}

mkdir -p "$WINEPREFIX"
[[ -d $eac_dir ]] || cp -r /opt/exact-audio-copy "$eac_dir"

fixups=1
[[ ${EAC_NO_FIXUPS:-0} == 1 ]] && fixups=0
server_running && fixups=0
((fixups)) && choose_drive_mode

if [[ ! -f $WINEPREFIX/system.reg ]] && ! server_running; then
	# Create the prefix before anything else uses it, without the Mono and
	# Gecko install dialogs (.NET is installed by winetricks below).
	WINEDLLOVERRIDES="mscoree,mshtml=d" wine wineboot -u
	wineserver -w
fi

((fixups)) && fix_prefix

cd "$eac_dir" || exit 1
if [[ ! -f $WINEPREFIX/dotnet48_installed ]]; then
	date >"$WINEPREFIX/dotnet48_installed" &&
		WINEDLLOVERRIDES="mscoree=d" winetricks --unattended dotnet48 &
fi
wine EAC.exe "$@"
wait
EAC_LAUNCHER
  chmod +x "${_launcher}"
  ln -s "/usr/bin/eac" "$pkgdir/usr/bin/exact-audio-copy"
  
  _desktop="${pkgdir}/usr/share/applications/eac.desktop"
  {
    echo '[Desktop Entry]'
    echo 'Type=Application'
    echo "Name=Exact Audio Copy ${pkgver}"
    echo "Comment=${pkgdesc}"
    echo 'Path=/opt/exact-audio-copy'
    echo 'Exec=/usr/bin/eac'
    echo 'Icon=/opt/exact-audio-copy/eac.ico.128.png'
    echo 'Terminal=false'
    echo 'Categories=AudioVideo;Audio;'
  } > ${_desktop}
}


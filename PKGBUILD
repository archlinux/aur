# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=collabora-online-server-nodocker
pkgver=4.0.0
pkgrel=1
pkgdesc="Collabora CODE (LibreOffice Online) server for Nextcloud or ownCloud, without Docker"
arch=('x86_64')
url="https://www.collaboraoffice.com/code/"
license=('MPL')
provides=('libreoffice' 'libreoffice-en-US')
makedepends=(bzip2 coreutils curl fontconfig gawk grep gzip libcap sed systemd tar util-linux xz)

# From official Archlinux’ LibreOffice:
optdepends=(
  'hunspell-de: German hunspell dictionaries for LibreOffice'
  'hunspell-en: English (US, UK, etc.) hunspell dictionaries for LibreOffice'
  'hunspell-en_AU: AU English hunspell dictionaries for LibreOffice'
  'hunspell-en_CA: CA English hunspell dictionaries for LibreOffice'
  'hunspell-en_GB: GB English hunspell dictionaries for LibreOffice'
  'hunspell-en_US: US English hunspell dictionaries for LibreOffice'
  'hunspell-es: Spanish hunspell dictionaries for LibreOffice'
  'hunspell-fr: French (modern) hunspell dictionaries for LibreOffice'
  'hunspell-he: Hebrew hunspell dictionary for LibreOffice'
  'hunspell-it: Italian dictionary for Hunspell for LibreOffice'
  'hunspell-ro: Romanian dictionary for Hunspell for LibreOffice'
  'hunspell-el: Greek hunspell dictionary for LibreOffice'
  'hunspell-hu: Hungarian hunspell dictionary for LibreOffice'
  'hunspell-nl: Dutch hunspell dictionaries for LibreOffice'
  'hunspell-pl: Polish dictionary for Hunspell for LibreOffice'
  'hyphen-de: German hyphenation rules for LibreOffice'
  'hyphen-en: English hyphenation rules for LibreOffice'
  'hyphen-es: Spanish hyphenation rules for LibreOffice'
  'hyphen-fr: French hyphenation rules for LibreOffice'
  'hyphen-it: Italian hyphenation rules for LibreOffice'
  'hyphen-nl: Dutch hyphenation rules for LibreOffice'
  'hyphen-ro: Romanian hyphenation rules for LibreOffice'
  'hyphen-hu: Hungarian hyphenation rules for LibreOffice'
  'hyphen-pl: Polish hyphenation rules for LibreOffice'
)
depends=(cpio noto-fonts poco)
source=(
  'https://www.collaboraoffice.com/repos/CollaboraOnline/CODE/Packages'
  install
  mkcert_example.sh
  nginx.conf
  sysusers
  tmpfiles
)
sha1sums=(
  'SKIP'
  'e2fe8ff373261782d93c500bcfb87de1350d225a'
  '68ac242ad285eeeca07cb486c22dfbf3a658fe81'
  'fe998836dbbd5c153de77d4ea877f25719dae304'
  '2d271f9493ea14c675af1bfa76f6b654569dd51f'
  'f9c102a06b2582548f13121e78790237e2cb38e1'
)

# From deb’s conffiles
backup=(
  opt/collaboraoffice6.0/share/psprint/psprint.conf
  etc/loolwsd/loolkitconfig.xcu
  etc/loolwsd/loolwsd.xml
)

# From deb’s pre/post scripts
install=install

# From Dockerfile (https://github.com/CollaboraOnline/Docker-CODE), minus i18n files
_upstream_deps='loolwsd code-brand'

# DEBIAN–ARCHLINUX EQUIVALENCES
#
# In case of a new upstream release:
#
# 1. Move all lines from $_upstream_equiv to $_upstream_equiv_OLD.
#
# 2. Run `makepkg -s` iteratively:
#  * Each time a dependency is missing, move it back from $_upstream_equiv_OLD to $_upstream_equiv.
#  * If a dependency is new, add a new line in $_upstream_equiv with nothing after the “=” sign.
#
# 3. When the package is done, in a terminal run: ./missing-deps.sh
#
# 4. For each “not found” line:
#  * If the missing file should be provided by a new dependency in $_upstream_equiv,
#    then put after the “=” sign the name of an Archlinux package that provides this file;
#    you may need to create the package if it does not exist (usually old versions).
#  * Else the missing file is probably expected to be present on any Debian/Ubuntu system;
#    thus add the missing dependency in the $depends array.
_upstream_equiv='
  adduser             = 
  cpio                = 
  fontconfig          = fontconfig
  init-system-helpers = 
  libc6               = gcc-libs
  libcap2             = libcap
  libcap2-bin         = libcap
  libcups2            = libcups
  libexpat1           = 
  libgcc1             = gcc-libs
  libgl1-mesa-glx     = mesa-libgl
  libpam0g            = pam
  libpcre3            = 
  libpng12-0          = libpng12
  libsm6              = libsm
  libssl1.0.0         = openssl-1.0
  libstdc++6          = gcc-libs
  libxcb-render0      = libxcb
  libxcb-shm0         = libxcb
  libxinerama1        = libxinerama
  libxrender1         = libxrender
  zlib1g              = zlib
'
_upstream_equiv_OLD='
'
_upstream_handle_dep() {
  local dep="$1"
  local eqv="$(grep "^[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")[[:blank:]]*=" <<<"$_upstream_equiv")"
  local meta="$(awk -F$'\n' -vRS= "/^Package:[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")\\n/{print}" Packages)"
  local seen=
  if [ -n "$eqv" ]; then
    dep="$(sed 's/.*=[[:blank:]]*//' <<<"$eqv")"
    [ -n "$dep" ] || return
    for seen in "${depends[@]}"; do
      [ "$seen" == "$dep" ] && return
    done
    if [[ "$dep" =~ :// ]]; then
      source[${#source[*]}]="$dep"
      sha1sums[${#sha1sums[*]}]="SKIP"
    else
      depends[${#depends[*]}]="$dep"
    fi
  elif [ -n "$meta" ]; then
    dep="$(sed -rn "s#^Filename:[[:blank:]]*(.*/)?#${source[0]%Packages}#p" <<<"$meta")"
    for seen in "${source[@]}"; do
      [ "$seen" == "$dep" ] && return
    done
    source[${#source[*]}]="$dep"
    sha1sums[${#sha1sums[*]}]="$(sed -rn "s#^SHA1:[[:blank:]]*##p" <<<"$meta")"
    while read dep; do if [ -n "$dep" ]; then
      _upstream_handle_dep "$dep"
    fi; done < <(
        sed -rn "s#^Depends:[[:blank:]]*##p" <<<"$meta" \
      | sed 's#([^)]*)##g; s#[[:blank:]]*,[[:blank:]]*#\n#g'
    )
  else
    echo "Unknown dependency: $dep" >&2; exit 1
  fi
}

if [ ${#source[*]} -eq 6 ]; then
  curl -s "${source[0]}" >Packages
  pkgver=$(
    awk -F$'\n' -vRS= '/^Package:[[:blank:]]*loolwsd\n/{print}' Packages \
    | sed -n 's/^Version:[[:blank:]]*\(.*\)-.*/\1/p'
  )
  for dep in $_upstream_deps; do
    _upstream_handle_dep "$dep"
  done
fi
unset _upstream_handle_dep _upstream_equiv _upstream_deps

package() {
  local data= f=
  cd "$pkgdir"

  for f in "$srcdir"/*.deb; do
    data="$(ar t "$f" | grep ^data)"
    case "$data" in
    *.bz2) ar p "$f" "$data" | tar -xjf - ;;
    *.gz) ar p "$f" "$data" | tar -xzf - ;;
    *.xz) ar p "$f" "$data" | tar -xJf - ;;
    *) echo "Unknown file format: $data" >&2; exit 1 ;;
    esac
  done
  chown -R $(id -nu):$(id -ng) .

  # /lib is deprecated
  mv {lib,usr/lib}

  # replace the embedded poco, which depends on unknown libpcre.so.3, with Arch poco
  rm -f usr/lib/libPoco*

  # use systemd for user allocation
  install -Dm0644 "$srcdir"/sysusers usr/lib/sysusers.d/$pkgname.conf

  # replace cron with systemd
  rm -rf etc/cron.d
  install -Dm0644 "$srcdir"/tmpfiles usr/lib/tmpfiles.d/$pkgname.conf

  # add dependency on systemd
  mv usr/lib{/lib,}/systemd
  rmdir usr/lib/lib
  sed -i '/^\[Unit\]/ a \
After=systemd-tmpfiles-setup.service' usr/lib/systemd/system/loolwsd.service

  # keep the cert-making script from the Dockerfile for reference
  install -Dm0644 "$srcdir"/mkcert_example.sh usr/share/doc/loolwsd/example.mkcert.sh

  # actually provide libreoffice, without conflicting with Archlinux’ libreoffice
  mkdir -p usr/share/applications
  sed -i 's#^Exec=collaboraoffice6.0#Exec=/opt/collaboraoffice6.0/program/soffice#' \
    opt/collaboraoffice6.0/share/xdg/*
  ls opt/collaboraoffice6.0/share/xdg \
  | while read f; do
    case "$f" in
    calc.desktop|draw.desktop|impress.desktop|writer.desktop)
      sed -i "s#^Icon=.*#Icon=/opt/collaboraoffice6.0/share/config/wizard/web/images/${f%.desktop}.gif#" \
        opt/collaboraoffice6.0/share/xdg/$f
      ;;
    *)
      sed -i 's#^Icon=.*#Icon=/opt/collaboraoffice6.0/share/config/wizard/web/images/other.gif#' \
        opt/collaboraoffice6.0/share/xdg/$f
      ;;
    esac
    mv opt/collaboraoffice6.0/share/xdg/"$f" usr/share/applications/"collaboraoffice-$f"
  done
  rm -rf opt/collaboraoffice6.0/share/xdg

  # give some hints about usage
  install -Dm0644 "$srcdir"/nginx.conf usr/share/doc/loolwsd/example.nginx.conf
}

# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Artem Alabin <kirpicheff@yandex.ru>
# Contributor: K0n24d <konrad AT knauber DOT net>

# TODO: New version of SQLite. Can we use the distro provided sqlite?
# TODO: New version of deprecated pbs.py
# TODO: Implement enclosed sbin patches upstream
# TODO: Graceful reload like Apache httpd for upgrades to running systems
# TODO: Version numbers in git tags instead of scanning configuration files
# TODO: Need to rebuild on upgrade: /var/urbackup/'{UrBackupUpdate.exe,UrBackupUpdate.sig}
# TODO: New feature: [x] Follow symbolic links on Windows clients
# TODO: Why don't the libs have versions?

# Build-n-install: makepkg -scCf
# For running systems, watch htop and upgrade when your urbackup server processes are idle
# sudo systemctl stop urbackup-server.service
# sudo pacman -U ...  (makepkg -i doesn't work with git packages)
# sudo systemctl start urbackup-server.service

# For major version changes clean or rename /urbackup and /var/urbackup

# See the btrfs section in the UrBackup Administration Manual for special instructions.
# The best configuration is where whole drive btrfs is mounted on /urbackup. The data
# and the db in /var are on separate spinners.

# To preserve your server identify for clients place these 3 files in with the PKGBUILD
# and they will be built into the package.
# server_ident.key
# server_ident.priv
# server_ident.pub

if [ ! -s 'PKGBUILD.local' ]; then
  cat > 'PKGBUILD.local' << EOF
_opt_BuildClient=0 # Default 0, 0=server, 1=client. You must use makepkg -sCf after changing this.
_opt_Headless=1    # Default 1, 0=GUI, 1=headless (only applies to client, ignored for server)
EOF
fi
source 'PKGBUILD.local'

set -u
if [ "${_opt_BuildClient}" -ne 0 ]; then
  _pkgname='urbackup-client'
else
  _pkgname='urbackup-server'
fi
pkgname="${_pkgname}-git"
pkgver=2.3.2.r207.g51daaa7e
pkgrel=1
pkgdesc='Client/Server network backup for Windows Workgroups and Linux, builds server or client'
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url='https://www.urbackup.org/'
license=('GPL')
depends=('crypto++' 'fuse')
makedepends=('python3' 'autoconf' 'git' 'unzip' 'wget')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
_verwatch=("${url}/download.html" '//hndl\.urbackup\.org/Server/[0-9\.]\+/urbackup-server-\([0-9\.]\+\)\.tar\.gz' 'l')
_scripts=(
  'btrfs_create_filesystem_snapshot'
  'btrfs_remove_filesystem_snapshot'
  'dattobd_create_filesystem_snapshot'
  'dattobd_remove_filesystem_snapshot'
  'lvm_create_filesystem_snapshot'
  'lvm_remove_filesystem_snapshot'
)
_srcdir='urbackup_backend'
_branchb='dev'
_branchf='dev'
source=("git+https://github.com/uroni/urbackup_backend.git#branch=${_branchb}" "git+https://github.com/uroni/urbackup_frontend_wx.git#branch=${_branchf}")
#source=("git+https://github.com/uroni/urbackup_backend.git#commit=9df2ba394f29ee86ad56fdd93179768aca3691fa" "git+https://github.com/uroni/urbackup_frontend_wx.git#commit=70378bf100c5d88e3342a4448c11a0cce83edc30")
source+=("${_scripts[@]}" 'defaults_client')
_cryptopp='cryptopp565.zip'
source+=("https://www.cryptopp.com/${_cryptopp}")
noextract=("${_cryptopp}")
sha256sums=('SKIP'
            'SKIP'
            '18b5eceb73086b86d904f80e9270df121d06d7c683f93c5449a82e7deb38e0ee'
            '334d9eb67a642d96e04874fd27c1b57d578c35b4cdc768d50db7ac2436f0927c'
            '869e6244efbf6e370938e2e5c94a16c0130f583815ddbd34802578656989048b'
            '23d6bdad352d33fe41acd50e0114f986cd4324c2c65ca16cea365cb99d90addd'
            'd5b462879e7c80139688c9d20ce1b1fe553386df9459def5e1d093d3a13d71fb'
            '0ffb3bbbf5faf939564681d24786767a4706132f2f081b7a870ecc718a8e9413'
            'd77fa6ad67141ae5cb4c3c6953783ce54aaaa3c1f2fe5bb28cd20948ddda12c4'
            'a75ef486fe3128008bbb201efee3dcdcffbe791120952910883b26337ec32c34')
if [ "${_opt_BuildClient}" -ne 0 ]; then
  unset install
  if [ "${_opt_Headless}" -eq 0 ]; then
    depends+=('wxgtk')
  fi
else
  optdepends=('btrfs-progs: compressed and subvolume assisted backups')
fi

_fn_getversion() {
  export _urverdone='x'
  declare -gA _urversion
  #local _branch="$(git branch)"
  #_branch="${_branch##\* }"

  local _line
  local _build
  while read -r _line; do
    local _tab=$'\t'
    _line="${_line//\"/}"
    _line="${_line//,/}"
    _line="${_line//\{/}"
    _line="${_line//\}/}"
    _line="${_line//${_tab}/}"
    _line="${_line## *}"
    printf '%q\n' "${_line}" 1>&2
    if [ ! -z "${_line}" ]; then
      case "${_line}" in
      [a-z]*':') _build="${_line%%:}";;
      [a-z]*': '[0-9\.]*)
        local _val="${_line##[a-z]*: }"
        local _key="${_line%%: [0-9\.]*}"
        _urversion["${_build}.${_key}"]="${_val}"
        ;;
      esac
    fi
  done < <(curl -s "http://buildserver.urbackup.org/urbackup_build_version_${_branchb}.json")
  _urversion['server.full_rev']="${_urversion[server.full]} Rev. $(git rev-parse HEAD)"
  echo "server.full_rev=${_urversion['server.full_rev']}"
  local _clar
  # _urversion['client.full']='03.000.02' # for testing zero trim
  IFS='.' _clar=(${_urversion['client.full']}) # split
  printf ' %s' "${_clar[@]}"; echo ''
  local _clarkey
  for _clarkey in "${!_clar[@]}"; do
    echo "${_clarkey}:${_clar[${_clarkey}]}"
    if [[ ! "${_clar[${_clarkey}]}" =~ ^[0-9]+$ ]]; then
      _clar["${_clarkey}"]="${_clar[${_clarkey}]%%[^0-9]*}" # it's a git package, we don't need beta
    fi
    _clar["${_clarkey}"]=$((_clar[${_clarkey}]+0)) # trim leading zeros
  done
  _urversion['client.ver_major']="${_clar[0]}"
  _urversion['client.ver_minor']=$(( ${_clar[1]}*1000 + ${_clar[2]}))
  local _clarx="${_clar[@]}"
  _urversion['client.num_short']="${_clarx// /.}" # join
}

pkgver() {
  set -u
  cd "${_srcdir}"
  cd 'client' || :
  local _gitver="$(git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  # The BUILDID is not supplied so is always zero
  local _filever="$(sed -n -e 's:^.*\[\([0-9\.]\+\)BUILDID.*$:\1:p' 'configure.ac_server')"
  #^#define VERSION "\([^"]*\)"$:\1:p' 'configure.ac_server')" #'
  if [ ! -z "${_filever}" ]; then
    _gitver="$(git describe --long --tags)"
    _gitver="r${_gitver#*-}"
    _gitver="${_gitver//-/.}"
    _gitver="${_filever}${_gitver}"
  fi
  echo "${_gitver}"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  git reset --hard

  # Some patches
  local _files
  readarray -t _files <<<"$(grep --exclude-dir='.git' -lrF '/sbin/')"
  sed -e 's:/usr/sbin/:/usr/bin/:g' \
      -e 's:/sbin/:/usr/bin/:g' \
    -i "${_files[@]}"
  unset _files

  sed -e 's,"C:\\\\urbackup",\n#ifdef _WIN32\n&\n#else\n"/urbackup"\n#endif\n,g' -i 'urbackupserver/server_settings.cpp' # Irksome bug!

  cp -p 'build_server.sh' 'build_server.Arch.sh'
  cp -p 'build_client.sh' 'build_client.Arch.sh'

  sed -e '# Block make so makepkg -e so works properly' \
      -e 's:^make:# &:g' \
      -e '# git reset does not apply to us. It would undo all my patches' \
      -e 's:^git reset:#&:g' \
      -e "# Version updates are now done here in PKGBUILD" \
      -e '/replace_versions.py/ s:^:#&:g' \
    -i 'build_server.Arch.sh' 'build_client.Arch.sh'

  _fn_getversion
  # We don't need this. This is to make it readable to ensure we're doing the same thing.
  expand -i -t8 'build/replace_versions.py' | \
  sed -e 's:\r$::g' > 'build/replace_versions.Arch.py'

  # Branding
  sed -e 's:\$version_short\$'":${_urversion[server.short]} Arch Linux:g" -i 'urbackupserver/www/index.htm'

  local _files
  readarray -t _files <<<"$(grep --exclude-dir='.git' --include '*client*' -lrF '$version_short$')"
  sed -e 's:\$version_short\$'":${_urversion[client.short]}:g" -i "${_files[@]}"  # must be done first
  unset _files

  local _files
  readarray -t _files <<<"$(grep --exclude-dir='.git' -lrF $'$version_short$\n$version_full_numeric$\n$version_full$\n$version_num_short$\n$version_maj$\n$version_min$')"
  sed -e 's:\$version_short\$'":${_urversion[server.short]}:g" \
      -e 's:\$version_full_numeric\$'":${_urversion[server.full_numeric]}:g" \
      -e 's:\$version_full\$'":${_urversion[server.full_rev]}:g" \
      -e 's:\$version_num_short\$'":${_urversion[client.num_short]}:g" \
      -e 's:\$version_maj\$'":${_urversion[client.ver_major]}:g" \
      -e 's:\$version_min\$'":${_urversion[client.ver_minor]}:g" \
    -i "${_files[@]}"
  unset _files
  test -z "$(grep --exclude-dir='.git' -lrF '$version_')" || echo "${}" # more $versions were added
  # replace_in_file("client/urbackup.wxi", "$product_id$", str(uuid.uuid1())) # Don't need this!

  # Correct some CRLF. cryptopp will be converted by unzip -a
  local _files
  readarray -t _files <<<"$(grep --exclude-dir='.git' -lrF $'\r')"
  sed -e 's:\r$::g' -i "${_files[@]}"
  unset _files

  # Doing the hashes is easier in sed too. We catch a few that the py misses.
  pushd 'urbackupserver/www' > /dev/null
  local _hashfile _newhashfile _hashmd5
  local _sedcmds=()
  for _hashfile in css/* js/*; do
    if [ -f "${_hashfile}" ] && grep -qFe "${_hashfile}" 'help.htm' 'index.htm' 'license.htm'; then
      _hashmd5="$(md5sum < "${_hashfile}" | cut -d' ' -f1)"
      _newhashfile="${_hashfile/\./.chash-${_hashmd5}.}"
      _sedcmds+=('-e' "s:${_hashfile}:${_newhashfile}:g")
      cp -p "${_hashfile}" "${_newhashfile}"
    fi
  done
  sed "${_sedcmds[@]}" -i 'help.htm' 'index.htm' 'license.htm'
  unset _sedcmds
  popd > /dev/null

  # Change wget to symlink
  sed -e 's:^\s*wget :ln -s "../../\${CRYPTOPP_NAME}" # &:g' \
      -e '# Fix CRLF -> LF' \
      -e 's:unzip -:&a:g' \
    -i 'download_cryptopp.sh'

  local CRYPTOPP_NAME=''
  source <(grep '^CRYPTOPP_NAME=' 'download_cryptopp.sh')
  test ! -z "${CRYPTOPP_NAME}" || echo "${}"
  if [ "${CRYPTOPP_NAME}" != "${_cryptopp}" ]; then
    set +u
    msg "Update PKGBUILD with _cryptopp='${CRYPTOPP_NAME}'"
    false
  fi

  sed -e 's:byte digest:unsigned char digest:g' -i 'md5.h'
  cat >> 'cryptoplugin/cryptopp_inc.h' <<EOF

#if (CRYPTOPP_VERSION >= 600) && (__cplusplus >= 201103L)
    using byte = CryptoPP::byte;
#else
    typedef unsigned char byte;
#endif
EOF

  if [ "${_opt_BuildClient}" -ne 0 ]; then
    ln -sf '../urbackup_frontend_wx' 'client'

    # replace_in_file("urbackupserver_installer_win/urbackup_server.wxi", "$product_id$", str(uuid.uuid1())) Don't need this!
    pushd 'client' > /dev/null
    local _files
    readarray -t _files <<<"$(grep --exclude-dir='.git' -lrF $'$version_short$\n$version_full_numeric$\n$version_full$\n$version_num_short$\n$version_maj$\n$version_min$')"
    sed -e 's:\$version_short\$'":${_urversion[client.short]}:g" \
        -e 's:\$version_full_numeric\$'":${_urversion[client.full_numeric]}:g" \
      -i "${_files[@]}"
    unset _files
    test -z "$(grep --exclude-dir='.git' -lrF '$version_')" || echo "${}" # more $versions were added
    popd > /dev/null

    if [ "${_opt_Headless}" -eq 0 ]; then
      sed -e '# Fix configure line' \
          -e 's:^\(\s*\)./configure.*$:  ./configure --prefix="/usr" --sbindir="/usr/bin" --localstatedir="/var":g' \
        -i 'build_client.Arch.sh'
    else
      sed -e '# Fix configure line' \
          -e 's:^\(\s*\)./configure.*$:  ./configure --prefix="/usr" --sbindir="/usr/bin" --localstatedir="/var" --enable-headless:g' \
        -i 'build_client.Arch.sh'
    fi
    sh -u -e 'build_client.Arch.sh'
  else
    rm -f 'client' # in case we switch from client to server
    sed -e '# Fix configure line' \
        -e 's:^\(\s*\)./configure.*$:  ./configure --prefix="/usr" --sbindir="/usr/bin" --sysconfdir="/etc" --localstatedir="/var" --enable-packaging --with-mountvhd:g' \
      -i 'build_server.Arch.sh'
    sh -u -e 'build_server.Arch.sh'
  fi
  rm 'build_server.Arch.sh' 'build_client.Arch.sh'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  local _makeopts=()
  if [ -z "${MAKEFLAGS:-}" ] || [ "${MAKEFLAGS//-j/}" = "${MAKEFLAGS}" ]; then
    local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
    _makeopts=(-j "${_nproc}")
  fi
  nice make -s "${_makeopts[@]}"
  set +u; msg2 'make dist'; set -u
  nice make -s "${_makeopts[@]}" dist
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make -s -j1 DESTDIR="${pkgdir}" install

  if [ "${_opt_BuildClient}" -ne 0 ]; then
    # urbackup2 client uses a different service name. Changing the server name is not cool.
    install -Dpm644 'urbackupclientbackend-debian.service' "${pkgdir}/usr/lib/systemd/system/urbackup-client.service"
    # urbackup2 client changed the service name.
    ln -s 'urbackup-client.service' "${pkgdir}/usr/lib/systemd/system/urbackupclientbackend.service"
    sed -i -e 's:/usr/local/sbin/:/usr/bin/:g' "${pkgdir}/usr/lib/systemd/system/urbackup-client.service"
    install -Dpm644 "docs/urbackupclientbackend.1" -t "${pkgdir}/usr/share/man/man1/"
    cd "${srcdir}"
    install -Dpm644 'defaults_client' "${pkgdir}/etc/default/urbackupclient"
    install -Dpm700 "${_scripts[@]}" -t "${pkgdir}/usr/share/urbackup/"
  else
    # Correct some file mode bits, thanks cfstras (from urbackup2)
    chmod a+x "${pkgdir}/usr/share/urbackup/www/"{css,fonts,js,images,}

    local _serverkey
    for _serverkey in 'server_ident.key' 'server_ident.priv' 'server_ident.pub'; do
      install -Dpm644 "${startdir}/${_serverkey}" "${pkgdir}/var/urbackup/${_serverkey}" || :
    done

    # special btrfs support
    install -Dpm644 <(echo '/urbackup') "${pkgdir}/etc/urbackup/backupfolder"

    install -Dpm644 'urbackup-server.service' -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dpm644 'urbackup-server-firewalld.xml' -t "${pkgdir}/usr/lib/firewalld/services/"
    install -Dpm644 'logrotate_urbackupsrv' "${pkgdir}/etc/logrotate.d/urbackupsrv"
    install -Dpm644 'docs/urbackupsrv.1' -t "${pkgdir}/usr/share/man/man1/"
    install -Dpm644 'defaults_server' -t "${pkgdir}/etc/default/urbackupsrv/"
  fi

  set +u
}
set +u
# vim: ts=2

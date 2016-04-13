# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Artem Alabin <kirpicheff@yandex.ru>
# Contributor: K0n24d <konrad AT knauber DOT net>

# TODO: New version of SQLite. Can we use the distro provided sqlite?
# TODO: New version of deprecated pbs.py
# TODO: Implement enclosed sbin patches upstream
# TODO: Graceful reload like Apache for upgrades to running systems
# TODO: Version numbers in git tags instead of scanning configuration files
# TODO: Need to rebuild on upgrade: /var/urbackup/'{UrBackupUpdate.exe,UrBackupUpdate.sig}
# TODO: New feature: [x] Follow symbolic links on Windows clients
# TODO: Why don't the libs have versions?

# Build-n-install: makepkg -scCf
# For running systems, watch htop and upgrade when your urbackup server processes are idle
# sudo systemctl stop urbackup-server.service
# makepkg -i
# sudo systemctl start urbackup-server.service

# Build-n-observe: makepkg -sCf
# Fix-n-rebuild:   makepkg -ef

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
pkgver=1.4.14.r0.gaf82731
pkgrel=1
pkgdesc='Client/Server network backup for Windows and Linux, builds server or client'
arch=('i686' 'x86_64')
url='http://www.urbackup.org/'
license=('GPL')
depends=('crypto++' 'fuse')
makedepends=('python3' 'autoconf' 'git')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
_verwatch=("${url/http/https}/download.html" 'https://hndl\.urbackup\.org/Server/[0-9\.]\+/urbackup-server-\([0-9\.]\+\)\.tar\.gz' 'l')
source=('git+https://github.com/uroni/urbackup_backend.git' 'git+https://github.com/uroni/urbackup_frontend_wx.git' 'urbackup-client.service')
sha256sums=('SKIP'
            'SKIP'
            'e4c40d10909417cd04898388bab41aa6434375b62944183f132e606ed71f70b2')
_srcdir='urbackup_backend'
if [ "${_opt_BuildClient}" -ne 0 ]; then
  unset install
  if [ "${_opt_Headless}" -eq 0 ]; then
    depends+=('wxgtk')
  fi
else
  optdepends=('btrfs-progs: compressed and subvolume assisted backups')
fi

_fn_getversion() {
  set > z
  export _urverdone='x'
  declare -gA _urversion
  local _branch="$(git branch)"
  _branch="${_branch##\* }"

  local _line
  local _build
  while read -r _line; do
    _line="${_line//\"/}"
    _line="${_line//,/}"
    _line="${_line//\{/}"
    _line="${_line//\}/}"
    if [ ! -z "${_line}" ]; then
      case "${_line}" in
      [a-z]*':') _build="${_line%%:}";;
      [a-z]*': '[0-9\.]*)
        local _val="${_line##[a-z]*: }"
        local _key="${_line%%: [0-9\.]*}"
        _urversion["${_build}.${_key}"]="${_val}"
        ;;
      esac
      echo "${_line}" 1>&2
    fi
  done < <(curl -s "http://buildserver.urbackup.org/urbackup_build_version_${_branch}.json")
  _urversion['server.full_rev']="${_urversion[server.full]} Rev. $(git rev-parse HEAD)"
  unset _key _val _build _line _branch
}

pkgver() {
  set -u
  cd "${srcdir}/${_srcdir}"
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
  cd "${srcdir}/${_srcdir}"
  git reset --hard

  _fn_getversion
  # Some patches
  sed -i -e 's:$PREFIX/sbin/:$PREFIX/bin/:g' start_urbackup_{client,server}
  sed -i -e 's:/sbin/btrfs:/usr/bin/btrfs:g' 'snapshot_helper/main.cpp'
  sed -i -e 's:/usr/sbin/:/usr/bin/:g' 'urbackupserver/doc/admin_guide.tex' 'urbackup-server.service'
  sed -i -e 's,L"C:\\\\urbackup",\n#ifdef _WIN32\n&\n#else\nL"/urbackup"\n#endif\n,g' 'urbackupserver/server_settings.cpp' # Irksome bug!

  # fix the build scripts
  #sed -i -e 's:response.readall():response.read():g' 'build/replace_versions.py' # python was always a bad choice for these text replacements. As of Python 3.5 this script doesn't work at all and read() is not a proper replacement for readall().
  #sed is the right tool for this job.

  sed -i -e 's:\$version_short\$'":${_urversion[server.short]} Arch Linux:g" 'urbackupserver/www/index.htm'
  sed -i -e 's:\$version_short\$'":${_urversion[server.short]}:g" 'urbackupserver_installer_win/urbackup_server.nsi' 'urbackupserver_installer_win/generate_msi.bat'
  sed -i -e 's:\$version_full\$'":${_urversion[server.full_rev]}:g" 'urbackupserver/www/index.htm'
  sed -i -e 's:\$version_full_numeric\$'":${_urversion[server.full_numeric]}:g" 'urbackupserver_installer_win/urbackup_server.wxs'
  # replace_in_file("urbackupserver_installer_win/urbackup_server.wxi", "$product_id$", str(uuid.uuid1())) Don't need this!

  cp -p 'build_server.sh' 'build_server.Arch.sh'
  cp -p 'build_client.sh' 'build_client.Arch.sh'
  sed -i -e '# Block make so makepkg -e so works properly' \
         -e 's:^make:exit 0\n#&:g' \
         -e "# We'll do git reset so we can make a few changes afterwards" \
         -e 's:^git reset:#&:g' \
         -e "# Version updates are now done here in PKGBUILD" \
         -e 's:^python3 :#&:g' \
    'build_server.Arch.sh' 'build_client.Arch.sh'

  if [ "${_opt_BuildClient}" -ne 0 ]; then
    ln -sf '../urbackup_frontend_wx' 'client'

    sed -i -e 's:\$version_short\$'":${_urversion[client.short]}:g" 'client_version.h' 'client/urbackup.nsi' 'client/urbackup_update.nsi' 'client/urbackup_notray.nsi' 'client/build_msi.bat'
    sed -i -e 's:\$version_full_numeric\$'":${_urversion[client.full_numeric]}:g" 'client/urbackup.wxs'
    # replace_in_file("client/urbackup.wxi", "$product_id$", str(uuid.uuid1())) # Don't need this!

    if [ "${_opt_Headless}" -eq 0 ]; then
      sed -i -e '# Fix configure line' \
             -e 's:^\(\s*\)./configure.*$:  ./configure --prefix="/usr" --sbindir="/usr/bin" --localstatedir="/var":g' \
        'build_client.Arch.sh'
    else
      sed -i -e '# Fix configure line' \
             -e 's:^\(\s*\)./configure.*$:  ./configure --prefix="/usr" --sbindir="/usr/bin" --localstatedir="/var" --enable-headless:g' \
        'build_client.Arch.sh'
    fi
    sh 'build_client.Arch.sh'
  else
    rm -f 'client' # to be pedantic
    sed -i -e '# Fix configure line' \
           -e 's:^\(\s*\)./configure.*$:  ./configure --prefix="/usr" --sbindir="/usr/bin" --sysconfdir="/etc" --localstatedir="/var" --enable-packaging --with-mountvhd:g' \
      'build_server.Arch.sh'
    sh 'build_server.Arch.sh'
  fi
  rm -f 'build_server.Arch.sh' 'build_client.Arch.sh'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${_srcdir}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  make -s -j "${_nproc}"
  make -s -j "${_nproc}" dist
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_srcdir}"

  make -s DESTDIR="${pkgdir}" install

  if [ "${_opt_BuildClient}" -ne 0 ]; then
    install -Dm644 "${srcdir}/urbackup-client.service" -t "${pkgdir}/usr/lib/systemd/system/"
    sed -i -e 's:/usr/sbin/:/usr/bin/:g' "${pkgdir}/usr/lib/systemd/system/urbackup-client.service"
    install -Dm644 "docs/start_urbackup_client.1" -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 "docs/urbackup_client.1" -t "${pkgdir}/usr/share/man/man1/"
  else
    local _serverkey
    for _serverkey in 'server_ident.key' 'server_ident.priv' 'server_ident.pub'; do
      install -Dpm644 "${srcdir}/../${_serverkey}" "${pkgdir}/var/urbackup/${_serverkey}" || :
    done

    # special btrfs support
    install -dm755 "${pkgdir}/etc/urbackup"
    echo '/urbackup' > "${pkgdir}/etc/urbackup/backupfolder"
    chmod 644 "${pkgdir}/etc/urbackup/backupfolder"

    install -Dpm644 'urbackup-server.service' -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dpm644 'urbackup-server-firewalld.xml' -t "${pkgdir}/usr/lib/firewalld/services/"
    install -Dpm644 'logrotate_urbackup_srv' "${pkgdir}/etc/logrotate.d/urbackup_srv"
    install -Dpm644 docs/{start_urbackup_server,urbackup_srv}.1 -t "${pkgdir}/usr/share/man/man1/"
  fi

  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  #! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  #! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  #! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  #! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}
set +u
# vim: ts=2

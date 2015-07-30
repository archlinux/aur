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
pkgver=1.4.9.r21.g6d3d464
pkgrel=1
pkgdesc='Client/Server network backup for Windows and Linux, builds server or client'
arch=('i686' 'x86_64')
url='http://www.urbackup.org/'
license=('GPL')
depends=('crypto++')
makedepends=('python3' 'autoconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/uroni/urbackup_backend.git' 'git+https://github.com/uroni/urbackup_frontend_wx.git' 'urbackup-client.service')
sha256sums=('SKIP'
            'SKIP'
            'e4c40d10909417cd04898388bab41aa6434375b62944183f132e606ed71f70b2')
install=("${_pkgname}.install")
_srcdir='urbackup_backend'
if [ "${_opt_BuildClient}" -ne 0 ]; then
  unset install
  if [ "${_opt_Headless}" -eq 0 ]; then
    depends+=('wxgtk')
  fi
else
  optdepends=('btrfs-progs: compressed and subvolume assisted backups')
fi

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
  # Some patches
  sed -i -e 's:$PREFIX/sbin/:$PREFIX/bin/:g' start_urbackup_{client,server}
  sed -i -e 's:/sbin/btrfs:/usr/bin/btrfs:g' 'snapshot_helper/main.cpp'
  sed -i -e 's:/usr/sbin/:/usr/bin/:g' 'urbackupserver/doc/admin_guide.tex' 'urbackup-server.service'
  sed -i -e 's,L"C:\\\\urbackup",\n#ifdef _WIN32\n&\n#else\nL"/urbackup"\n#endif\n,g' 'urbackupserver/server_settings.cpp' # Irksome bug!

  # fix the build scripts
  cp -p 'build_server.sh' 'build_server.Arch.sh'
  cp -p 'build_client.sh' 'build_client.Arch.sh'
  sed -i -e '# Block make so makepkg -e so works properly' \
         -e 's:^make:exit 0\n#&:g' \
         -e "# We'll do git reset so we can make a few changes afterwards" \
         -e 's:^git reset:#&:g' \
    'build_server.Arch.sh' 'build_client.Arch.sh'
  if [ "${_opt_BuildClient}" -ne 0 ]; then
    ln -sf '../urbackup_frontend_wx' 'client'
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
  make -s -j $(nproc)
  make dist
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_srcdir}"

  make DESTDIR="${pkgdir}" install

  if [ "${_opt_BuildClient}" -ne 0 ]; then
    install -Dm755 "${srcdir}/urbackup-client.service" -t "${pkgdir}/usr/lib/systemd/system/"
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

# Ensure there are no forbidden paths. Comment these out as you find or need exceptions. (git-aurcheck)
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  # ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}" # This fails over
  # ! grep -alqr "/usr/local" "${pkgdir}" || echo "${}" # This fails over
  ! test -d "${pkgdir}/usr/sbin" || echo "${}"
  ! test -d "${pkgdir}/usr/local" || echo "${}"
  set +u
}
set +u
# vim: ts=2

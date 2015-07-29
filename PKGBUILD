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
# TODO: urbackup-client-git

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

set -u
_pkgname='urbackup-server'
pkgname="${_pkgname}-git"
pkgver=1.4.9.r21.g6d3d464
pkgrel=1
pkgdesc='Client/Server network backup for Windows and Linux'
arch=('i686' 'x86_64')
url='http://www.urbackup.org/'
license=('GPL')
depends=('crypto++')
optdepends=('btrfs-progs: compressed and subvolume assisted backups')
makedepends=('python3' 'autoconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/uroni/urbackup_backend.git')
sha256sums=('SKIP')
install=("${_pkgname}.install")
_srcdir='urbackup_backend'

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
  cp -p 'build_server.sh' 'build_server.Arch.sh' # git reset --hard immediately reverts the origional
  sed -i -e '# Fix configure line' \
         -e 's:^\(\s*\)./configure.*$:  ./configure --prefix="/usr" --sbindir="/usr/bin" --sysconfdir="/etc" --localstatedir="/var" --enable-packaging --with-mountvhd:g' \
         -e '# Block make so makepkg -e so works properly' \
         -e 's:^make:exit 0\n#&:g' \
         -e "# We'll do git reset so we can make a few changes afterwards" \
         -e 's:^git reset:#&:g' \
    'build_server.Arch.sh'
  git reset --hard
  sed -i -e 's:$PREFIX/sbin/:$PREFIX/bin/:g' start_urbackup_{client,server}
  sed -i -e 's:/sbin/btrfs:/usr/bin/btrfs:g' 'snapshot_helper/main.cpp'
  sed -i -e 's:/usr/sbin/:/usr/bin/:g' 'urbackupserver/doc/admin_guide.tex' 'urbackup-server.service'
  sed -i -e 's,L"C:\\\\urbackup",\n#ifdef _WIN32\n&\n#else\nL"/urbackup"\n#endif\n,g' 'urbackupserver/server_settings.cpp' # Irksome bug!
  sh 'build_server.Arch.sh'
  rm -f 'build_server.Arch.sh'
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

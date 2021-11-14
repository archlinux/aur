# Maintainer: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Rayfalling <Rayfalling@outlook.com>
# Contributor: facekapow, rayfalling, Ducksoft
pkgname=genie-systemd-git
pkgver=1.44.r6.g52800cf
pkgrel=2
pkgdesc="A quick way into a systemd \"bottle\" for WSL"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('Unlicense')
depends=('daemonize' 'dotnet-runtime-5.0-bin' 'dotnet-host')
makedepends=('dotnet-sdk-5.0-bin' 'git')
provides=('genie-systemd')
conflicts=('genie-systemd')
options=(!strip)
source=("git+https://github.com/arkane-systems/genie.git")
sha256sums=('SKIP')
backup=('etc/genie.ini')

pkgver() {
  cd genie
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd genie/binsrc
  make -C genie
  make -C runinwsl
}

package() {
  cd genie
  
  # Binaries
  install -Dm4755 binsrc/genie/bin/Release/net5.0/linux-x64/publish/genie -t ${pkgdir}/usr/libexec/genie
  install -Dm0755 binsrc/runinwsl/bin/Release/net5.0/linux-x64/publish/runinwsl -t ${pkgdir}/usr/libexec/genie

  # Environment generator.
  install -Dm0755 othersrc/scripts/80-genie-envar.sh -t ${pkgdir}/usr/libexec/genie

  # Runtime dir mapping
  install -Dm0755 othersrc/scripts/map-user-runtime-dir.sh -t ${pkgdir}/usr/libexec/genie
  install -Dm0755 othersrc/scripts/unmap-user-runtime-dir.sh -t ${pkgdir}/usr/libexec/genie

  # Configuration file.
  install -Dm0644 othersrc/etc/genie.ini -t ${pkgdir}/etc

  # genie symlink
  mkdir -p ${pkgdir}/usr/bin
  ln -s /usr/libexec/genie/genie ${pkgdir}/usr/bin/genie

  # 10-genie-envar.sh symlinks
  mkdir -p ${pkgdir}/usr/lib/systemd/user-environment-generators
  mkdir -p ${pkgdir}/usr/lib/systemd/system-environment-generators
  ln -s /usr/libexec/genie/80-genie-envar.sh ${pkgdir}/usr/lib/systemd/user-environment-generators/80-genie-envar.sh
  ln -s /usr/libexec/genie/80-genie-envar.sh ${pkgdir}/usr/lib/systemd/system-environment-generators/80-genie-envar.sh

	# Unit files.
  install -Dm0644 othersrc/lib-systemd-system/wslg-xwayland.service -t ${pkgdir}/usr/lib/systemd/system
  install -Dm0644 othersrc/lib-systemd-system/wslg-xwayland.socket -t ${pkgdir}/usr/lib/systemd/system
  mkdir -p ${pkgdir}/usr/lib/systemd/system/sockets.target.wants
  ln -s /usr/lib/systemd/system/wslg-xwayland.socket ${pkgdir}/usr/lib/systemd/system/sockets.target.wants/wslg-xwayland.socket

  install -Dm0644 othersrc/lib-systemd-system/user-runtime-dir@.service.d/override.conf -t ${pkgdir}/usr/lib/systemd/system/user-runtime-dir@.service.d

  # binfmt.d
  install -Dm0644 othersrc/usr-lib/binfmt.d/WSLInterop.conf -t ${pkgdir}/usr/lib/binfmt.d

  # man page
  install -Dm0644 othersrc/docs/genie.8 -t ${pkgdir}/usr/share/man/man8
}

# vim:set ts=2 sw=2 et:

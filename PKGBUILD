# $Id$
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Zygmunt Krynicki <me at zygoon dot pl>

pkgname=snapd-confinement
_pkgname=snapd
pkgver=2.0.10
pkgrel=1
pkgdesc="Service and tools for management of snap packages (with confinement enabled)."
arch=('i686' 'x86_64')
url="https://github.com/snapcore/snapd"
license=('GPL3')
depends=('snap-confine-apparmor' 'squashfs-tools')
makedepends=('git' 'go' 'go-tools' 'bzr')
checkdepends=('python')
conflicts=('snapd')
replaces=('snapd')
options=('!strip' 'emptydirs')
install=snapd.install
source=("git+https://github.com/snapcore/$_pkgname.git#tag=$pkgver"
        'snapd.sh'
        'fix_test.patch'
	'disable-devmode-enforcing.patch')
md5sums=('SKIP'
         '1d841a1d09ba86945551dfc5c5658b2e'
         '7fd19e053051825b189914cedb95c3e7'
         'cf60668da3dbce5a779aec3c52c69528')

_gourl=github.com/snapcore/snapd

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "$srcdir/fix_test.patch"
  patch -Np1 -i "$srcdir/disable-devmode-enforcing.patch"

  # Use $srcdir/go as our GOPATH
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH"
  # Have snapd checkout appear in a place suitable for subsequent GOPATH This
  # way we don't have to go get it again and it is exactly what the tag/hash
  # above describes.
  mkdir -p "$(dirname "$GOPATH/src/${_gourl}")"
  ln --no-target-directory -fs "$srcdir/$_pkgname" "$GOPATH/src/${_gourl}"
}

build() {
  export GOPATH="$srcdir/go"
  # Use get-deps.sh provided by upstream to fetch go dependencies using the
  # godeps tool and dependencies.tsv (maintained upstream).
  cd "$GOPATH/src/${_gourl}"
  ./get-deps.sh
  # Build/install snap and snapd
  go install "${_gourl}/cmd/snap"
  go install "${_gourl}/cmd/snapd"
}

check() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/${_gourl}"
  ./run-checks --unit
  ./run-checks --static
}

package() {
  export GOPATH="$srcdir/go"
  # Ensure that we have /var/lib/snapd/{hostfs,lib/gl}/ as they are required by snap-confine
  # for constructing some bind mounts around.
  install -d -m 755 "$pkgdir/var/lib/snapd/hostfs/" "$pkgdir/var/lib/snapd/lib/gl/"
  # Install the refresh timer and service for updating snaps
  install -d -m 755 "$pkgdir/usr/lib/systemd/system/"
  install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.refresh.service" "$pkgdir/usr/lib/systemd/system"
  install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.refresh.timer" "$pkgdir/usr/lib/systemd/system"
  # Install the snapd socket and service for the main daemon
  install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.service" "$pkgdir/usr/lib/systemd/system"
  install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.socket" "$pkgdir/usr/lib/systemd/system"
  # Install legacy "frameworks" units
  # TODO: drop those when they go away upstream
  install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.frameworks-pre.target" "$pkgdir/usr/lib/systemd/system"
  install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.frameworks.target" "$pkgdir/usr/lib/systemd/system"
  # Install snap and snapd executables
  install -d -m 755 "$pkgdir/usr/bin/"
  install -m 755 "$GOPATH/bin/snap" "$pkgdir/usr/bin/"
  install -d -m 755 "$pkgdir/usr/lib/snapd"
  install -m 755 "$GOPATH/bin/snapd" "$pkgdir/usr/lib/snapd/"
  # Install script to export binaries paths of snaps
  install -Dm 755 "$srcdir/snapd.sh" "$pkgdir/etc/profile.d/apps-bin-path.sh"
}

# Maintainer: aimileus < $(echo YWltaWxpdXNAcHJvdG9ubWFpbC5jb20K | base64 -d) >

# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Zygmunt Krynicki <me at zygoon dot pl>

pkgname=snapd
pkgdesc="Service and tools for management of snap packages."
depends=('squashfs-tools' 'libseccomp' 'libsystemd')
pkgver=2.30
pkgrel=3
arch=('x86_64')
url="https://github.com/snapcore/snapd"
license=('GPL3')
makedepends=('git' 'go-pie' 'go-tools' 'bzr' 'libcap' 'python-docutils' 'systemd' 'xfsprogs')
conflicts=('snap-confine')
options=('!strip' 'emptydirs')
install=snapd.install
source=("git+https://github.com/snapcore/${pkgname}.git#tag=${pkgver}")
md5sums=('SKIP')

_gourl=github.com/snapcore/snapd

prepare() {
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH"

  # Have snapd checkout appear in a place suitable for subsequent GOPATH. This
  # way we don't have to go get it again and it is exactly what the tag/hash
  # above describes.
  mkdir -p "$(dirname "$GOPATH/src/${_gourl}")"
  ln --no-target-directory -fs "$srcdir/$pkgname" "$GOPATH/src/${_gourl}"

  # Patch snap-seccomp build flags not to link libseccomp statically.
  sed -i -e 's/-Wl,-Bstatic -lseccomp -Wl,-Bdynamic/-lseccomp/' "$srcdir/$pkgname/cmd/snap-seccomp/main.go"
}

build() {
  export GOPATH="$srcdir/go"

  export CGO_ENABLED="1"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd $pkgname
  ./mkversion.sh $pkgver

  # Use get-deps.sh provided by upstream to fetch go dependencies using the
  # godeps tool and dependencies.tsv (maintained upstream).
  cd "$GOPATH/src/${_gourl}"
  XDG_CONFIG_HOME="$srcdir" ./get-deps.sh

  # Build go binaries
  go install "${_gourl}/cmd/snap"
  go install "${_gourl}/cmd/snapctl"
  go install "${_gourl}/cmd/snapd"
  go install "${_gourl}/cmd/snap-seccomp"
  go install "${_gourl}/cmd/snap-update-ns"
  go install "${_gourl}/cmd/snap-exec"

  # Generate the real systemd units out of the available templates
  make -C data/systemd
    SNAP_MOUNT_DIR=/var/lib/snapd/snap

  cd cmd
  autoreconf -i -f
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/snapd \
    --with-snap-mount-dir=/var/lib/snapd/snap \
    --disable-apparmor \
    --enable-nvidia-arch \
    --enable-merged-usr
  make
}


package() {
  export GOPATH="$srcdir/go"
  # Ensure that we have /var/lib/snapd/{hostfs,lib/gl}/ as they are required
  # by snap-confine for constructing some bind mounts around.
  install -dm755 "$pkgdir/var/lib/snapd/hostfs/" "$pkgdir/var/lib/snapd/lib/gl/"

  # Install bash completion
  install -Dm644 "$srcdir/$pkgname/data/completion/snap" \
    "$pkgdir/usr/share/bash-completion/completion/snap"
  install -Dm644 "$srcdir/$pkgname/data/completion/complete.sh" \
    "$pkgdir/usr/lib/snapd/complete.sh"
  install -Dm644 "$srcdir/$pkgname/data/completion/etelpmoc.sh" \
    "$pkgdir/usr/lib/snapd/etelpmoc.sh"

  # Install systemd units, dbus services and a script for environment variables
  make -C "$srcdir/$pkgname/data/" install \
     SYSTEMDSYSTEMUNITDIR=/usr/lib/systemd/system \
     DESTDIR="$pkgdir"

  # Install polkit policy
  install -Dm644 "$srcdir/$pkgname/data/polkit/io.snapcraft.snapd.policy" \
    "$pkgdir/usr/share/polkit-1/actions/io.snapcraft.snapd.policy"

  # Install executables
  install -Dm755 "$GOPATH/bin/snap" "$pkgdir/usr/bin/snap"
  install -Dm755 "$GOPATH/bin/snapctl" "$pkgdir/usr/bin/snapctl"
  install -Dm755 "$GOPATH/bin/snapd" "$pkgdir/usr/lib/snapd/snapd"
  install -Dm755 "$GOPATH/bin/snap-seccomp" "$pkgdir/usr/lib/snapd/snap-seccomp"
  install -Dm755 "$GOPATH/bin/snap-update-ns" "$pkgdir/usr/lib/snapd/snap-update-ns"
  install -Dm755 "$GOPATH/bin/snap-exec" "$pkgdir/usr/lib/snapd/snap-exec"
  install -Dm755 "$srcdir/$pkgname/packaging/fedora/snap-mgmt.sh" "$pkgdir/usr/lib/snapd/snap-mgmt"

  # Symlink /var/lib/snapd/snap to /snap so that --classic snaps work
  ln -s var/lib/snapd/snap "$pkgdir/snap"

  # pre-create directories
  install -dm755 "$pkgdir/var/lib/snapd/snap"
  install -dm755 "$pkgdir/var/cache/snapd"
  install -dm755 "$pkgdir/var/lib/snapd/assertions"
  install -dm755 "$pkgdir/var/lib/snapd/desktop/applications"
  install -dm755 "$pkgdir/var/lib/snapd/device"
  install -dm755 "$pkgdir/var/lib/snapd/hostfs"
  install -dm755 "$pkgdir/var/lib/snapd/mount"
  install -dm755 "$pkgdir/var/lib/snapd/seccomp/bpf"
  install -dm755 "$pkgdir/var/lib/snapd/snap/bin"
  install -dm755 "$pkgdir/var/lib/snapd/snaps"
  install -dm755 "$pkgdir/var/lib/snapd/lib/gl"
  install -dm000 "$pkgdir/var/lib/snapd/void"
  install -dm700 "$pkgdir/var/lib/snapd/cookie"
  install -dm700 "$pkgdir/var/lib/snapd/cache"

  make -C "$srcdir/$pkgbase/cmd" install DESTDIR="$pkgdir/"

  # Install man file
  snap help --man > "$pkgdir/usr/share/man/man1/snap.1"

  # Install the "info" data file with snapd version
  install -m 644 -D "$GOPATH/src/${_gourl}/data/info" \
          "$pkgdir/usr/lib/snapd/info"
}

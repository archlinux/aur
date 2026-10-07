# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgbase=alpm-dbus-git
pkgname=('alpm-dbus-git' 'alpm-dbus-client-git' 'alpm-packagekit-git')
pkgver=0.4.0.r48.g086356a
pkgrel=1
pkgdesc='D-Bus service for system package management on top of ALPM'
arch=('x86_64')
url='https://gitlab.archlinux.org/ogarcia/alpm-dbus'
license=('Apache-2.0 OR MIT')
# pacman and xz provide libalpm and liblzma to link against, and pacman-conf
# for the tests; dbus provides the dbus-daemon the tests start.
makedepends=('cargo' 'git' 'pacman' 'xz')
checkdepends=('dbus')
# makepkg's LTO turns the C code bundled by zstd-sys into GCC bitcode, which
# the Rust linker cannot link.
options=('!lto')
# The ALPM project crates are path dependencies on a checkout next to
# alpm-dbus (../alpm). Until upstream MR !652 is merged and released, they
# come from this fork branch.
source=('alpm-dbus::git+https://gitlab.archlinux.org/ogarcia/alpm-dbus.git'
        'alpm::git+https://gitlab.archlinux.org/ogarcia/alpm.git#branch=feat/repo-db-access')
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd alpm-dbus
  printf '%s.r%s.%s' "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd alpm-dbus
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd alpm-dbus
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release \
    --package alpm-dbus \
    --package alpm-dbus-client --features alpm-dbus-client/cli \
    --package alpm-packagekit
}

check() {
  cd alpm-dbus
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The D-Bus tests start their own dbus-daemon, and the upgrade tests run
  # libalpm transactions in a system inside a temporary directory.
  cargo test --frozen --workspace --all-features
}

package_alpm-dbus-git() {
  depends=('dbus' 'glibc' 'libgcc' 'libgcc_s.so' 'pacman' 'libalpm.so' 'polkit' 'xz' 'liblzma.so')
  optdepends=('alpm-dbus-client: command line client'
              'alpm-packagekit: PackageKit backend, for GNOME Software or KDE Discover')
  provides=('alpm-dbus')
  conflicts=('alpm-dbus')

  cd alpm-dbus
  install -Dm0755 -t "$pkgdir/usr/bin" target/release/alpm-dbus

  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system" alpm-dbus/data/alpm-dbus.service
  install -Dm0644 -t "$pkgdir/usr/share/dbus-1/system.d" alpm-dbus/data/me.ogarcia.AlpmDbus1.conf
  install -Dm0644 -t "$pkgdir/usr/share/dbus-1/system-services" \
    alpm-dbus/data/me.ogarcia.AlpmDbus1.service
  install -Dm0644 -t "$pkgdir/usr/share/polkit-1/actions" alpm-dbus/data/me.ogarcia.AlpmDbus1.policy

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.Apache-2.0.txt LICENSE.MIT.txt
}

package_alpm-dbus-client-git() {
  pkgdesc='Command line client of the alpm-dbus service'
  # Not linked against, but useless without the service.
  depends=('alpm-dbus' 'glibc' 'libgcc' 'libgcc_s.so')
  provides=('alpm-dbus-client')
  conflicts=('alpm-dbus-client')

  cd alpm-dbus
  install -Dm0755 -t "$pkgdir/usr/bin" target/release/alpm-dbus-client
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.Apache-2.0.txt LICENSE.MIT.txt
}

package_alpm-packagekit-git() {
  pkgdesc='PackageKit backend for the alpm-dbus service'
  # Not linked against: packagekitd provides the symbols it uses when it
  # loads the backend, and the service does the work.
  depends=('alpm-dbus' 'glibc' 'libgcc' 'libgcc_s.so' 'packagekit')
  provides=('alpm-packagekit')
  conflicts=('alpm-packagekit')
  install=alpm-packagekit.install

  cd alpm-dbus
  install -Dm0755 target/release/libalpm_packagekit.so \
    "$pkgdir/usr/lib/packagekit-backend/libpk_backend_alpm-dbus.so"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.Apache-2.0.txt LICENSE.MIT.txt
}

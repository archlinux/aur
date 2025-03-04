# Maintainer: Nicholas Yang <nicolasyang243@proton.me>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=rtkit-suspend
pkgver=0.13
pkgrel=1
pkgdesc="Realtime Policy and Watchdog Daemon (logind suspend support)"
url="https://github.com/arthurt/rtkit"
arch=(x86_64)
license=(GPL3 custom:BSD)
depends=(dbus polkit systemd)
makedepends=(git meson vim)
provides=(rtkit)
conflicts=(rtkit)
_commit=4ac22bbbb5334a5763c6368830c085bf9841c0a7    # branch suspend-resume
source=("git+https://github.com/arthurt/rtkit#commit=$_commit")
b2sums=('5aea6f6da6752f2b27f521f979db3f322932a86bd410965cc33e77e723949280409486ec6d907c6d32e4d72325168a425d8cc1cfa71eecb5f70117f54dba4623')

prepare() {
  cd rtkit
}

build() {
  arch-meson rtkit build -D installed_tests=false
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  echo 'u rtkit 133 "RealtimeKit" /proc' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/rtkit.conf"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 rtkit/LICENSE
  sed -ne '4,25p' rtkit/rtkit.c |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# Maintainer: Mathias Rav <m@git.strova.dk>
pkgname=fbspinner
pkgver=0.1.0
pkgrel=1
pkgdesc="Show a spinner on the framebuffer during system boot"
arch=('i686' 'x86_64')
url="https://github.com/Mortal/$pkgname"
license=('GPL')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("https://github.com/Mortal/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('1103f7b75cfac006de5ab8c7ee3fce1d')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release

    cat > "$srcdir/$pkgname.service" <<EOF
[Service]
ExecStart=/usr/bin/$pkgname
WorkingDirectory=/usr/share/$pkgname

[Unit]
Description=Show spinner on framebuffer
DefaultDependencies=no
Wants=systemd-vconsole-setup.service
After=systemd-vconsole-setup.service systemd-udev-trigger.service systemd-udevd.service
ConditionKernelCommandLine=!plymouth.enable=0

[Install]
WantedBy=multi-user.target
Also=$pkgname-quit.service
EOF
    cat > "$srcdir/$pkgname-quit.service" <<EOF
[Unit]
Description=Terminate spinner on framebuffer
After=rc-local.service $pkgname.service systemd-user-sessions.service
Before=getty@tty1.service

[Service]
ExecStartPre=-/bin/sleep 5
ExecStart=-/usr/bin/systemctl stop $pkgname
Type=oneshot
TimeoutSec=20

[Install]
WantedBy=multi-user.target
EOF
}

package() {
    cd "$pkgname-$pkgver"
    cargo install --root="$pkgdir/usr" --path .
    rm -f "$pkgdir/usr/.crates.toml"
    install -Dm0644 "$srcdir/$pkgname-$pkgver/share/anim.bin" "$pkgdir/usr/share/$pkgname/anim.bin"
    install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm0644 "$srcdir/$pkgname-quit.service" "$pkgdir/usr/lib/systemd/system/$pkgname-quit.service"
}

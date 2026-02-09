# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="Japanese input method for fcitx5, powered by azooKey engine"
arch=('x86_64')
url="https://hazkey.hiira.dev/"
license=('MIT')
depends=('fcitx5>=5.0.4' 'qt6-base')
optdepends=('vulkan-icd-loader: Zenzai Vulkan Backend')
conflicts=('fcitx5-hazkey')
provides=('fcitx5-hazkey' 'hazkey-server' 'hazkey-settings')
source=("https://github.com/7ka-Hiira/fcitx5-hazkey/releases/download/$pkgver/fcitx5-hazkey-$pkgver-x86_64.tar.gz"
        "LICENSE")
sha256sums=('feed9fd0bd29f21fde2b7e3b55544692359937d743f4c301dc5c6ebfa777f55b'
            '36ae30a03484d88f0f90e1985750b0a3f43521bf0a5c8112354bec2de60e0c5b')
options=('!debug')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"

    # Move files to adapt to Arch Linux environment
    cp -a ${pkgdir}/usr/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib/
    rm -r ${pkgdir}/usr/lib/x86_64-linux-gnu/
    rm ${pkgdir}/usr/bin/hazkey-settings
    ln -s /usr/lib/hazkey/hazkey-settings ${pkgdir}/usr/bin/hazkey-settings

    sed -i '/# hazkey-server wrapper script/r /dev/stdin' "${pkgdir}/usr/bin/hazkey-server" <<EOF

if [ -z "\${GGML_BACKEND_DIR}" ] ; then
    export GGML_BACKEND_DIR=/usr/lib/hazkey/libllama/backends/
fi

EOF
    sed -i 's/x86_64-linux-gnu\///g' ${pkgdir}/usr/bin/hazkey-server

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

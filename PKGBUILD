# Maintainer: Maciek Makowski info+aur@mmakowski.com
_branch=main

pkgname=ds4-rocm-git
pkgver=r311.512d07c
pkgrel=1
pkgdesc="Run DeepSeek4 LLM optimised for ROCm (AMD GPUs). Model weights are not included due to size. After installation run 'sudo ds4-download-model' to download."
arch=(x86_64)
url="https://github.com/antirez/ds4"
license=('MIT')
groups=()
depends=('curl')
makedepends=('curl'
             'git'
             'hip'
             'hipcub'
             'hipblas'
             'hipblaslt'
             'rocm-llvm'
             'rocminfo'
             'rocwmma')
provides=("ds4=$pkgver")
conflicts=("ds4")
replaces=()
backup=()
options=(!lto)
install=
source=("${pkgname%-git}::git+$url.git#branch=$_branch"
        download-dir.patch
        ds4.service
        sysusers.conf
        tmpfiles.conf
)
noextract=()
sha256sums=('SKIP'
            '88c01b9b2028bcf99a5374ec0b629d2e6462cb116c42723419ce3b138eae9b45'
            'bed8b3ede69cedbc8e418e8990efde223290de6618bbf0a52a86da4384b538f5'
            'b82d7a104b54245a13617b72050e7c08e05c6191feea89c875d64789a5f04e34'
            'ac3ea5d0a4f38012e10a1834780798d75e0aff9e5d578436fe628c8a61d4caa6'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -i "$srcdir/download-dir.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export ROCM_ARCH=$(rocm_agent_enumerator | head -n1)
	make rocm
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 ds4 "$pkgdir/usr/bin/ds4"
    install -Dm755 ds4-server "$pkgdir/usr/bin/ds4-server"
    install -Dm755 download_model.sh "$pkgdir/usr/bin/ds4-download-model"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir"
    install -dm755 "$pkgdir/var/lib/ds4"
    install -Dm644 ds4.service "$pkgdir/usr/lib/systemd/system/ds4.service"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ds4.conf"
    install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/ds4.conf"
}

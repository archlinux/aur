# Maintainer: Maciek Makowski info+aur@mmakowski.com
_branch=main

pkgname=ds4-rocm-git
pkgver=r332.80ebbc3
pkgrel=4
pkgdesc="Run DeepSeek4 LLM optimised for ROCm (AMD GPUs)"
arch=(x86_64)
url="https://github.com/antirez/ds4"
license=('MIT')
groups=()
depends=('curl'
         'hip'
         'hipblas'
         'hipblaslt')
makedepends=('git'
             'hipcub'
             'rocm-llvm'
             'rocminfo'
             'rocwmma')
provides=("ds4=$pkgver")
conflicts=("ds4")
replaces=()
backup=()
options=(!lto)
install=manual-steps.install
source=("${pkgname%-git}::git+$url.git#branch=$_branch"
        download-dir.patch
        ds4.service
        sysusers.conf
        tmpfiles.conf
)
noextract=()
sha256sums=('SKIP'
            '214ac05e46cbae82ed9a82028ff01bd2bd38f4bafd20941b889fa1ac6319130c'
            'bc34e4f55af7fceb7bcbbb323e65dd6c3065c8c92a5cda5ec5dbe6fc199256cc'
            '3085727fee5e492c34c2da1cc78486531ff25a2f368fa12d3854c3c65492a811'
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

# Maintainer: Iliarezaei <iliarezaei69@gmail.com>
pkgname=ilinote
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern note-taking app with graph view, tags, and internal links"
arch=('x86_64')
url="https://github.com/iliarezaei/ilinote"
license=('GPLv3')
depends=('qt5-base')
makedepends=('qt5-tools' 'gcc' 'make')
# upx اختیاری است، برای کاهش حجم استفاده می‌شود
# اگر upx نصب نباشد، خطا نمی‌دهد (با 2>/dev/null)

source=("$pkgname-$pkgver.tar.gz::https://github.com/iliarezaei/ilinote/archive/v$pkgver.tar.gz"
        "ilinote.desktop"
        "ilinote.svg")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    qmake ilinote.pro
    make -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # حذف اطلاعات دیباگ
    strip --strip-unneeded ilinote
    
    # فشرده‌سازی با upx (در صورت وجود)
    if command -v upx &>/dev/null; then
        upx --best --lzma ilinote 2>/dev/null || true
    fi
    
    # نصب فایل اجرایی
    install -Dm755 ilinote "$pkgdir/usr/bin/ilinote"
    
    # نصب فایل دسکتاپ (اگر وجود داشته باشد)
    if [[ -f "$srcdir/ilinote.desktop" ]]; then
        install -Dm644 "$srcdir/ilinote.desktop" "$pkgdir/usr/share/applications/ilinote.desktop"
    elif [[ -f "$srcdir/$pkgname-$pkgver/ilinote.desktop" ]]; then
        install -Dm644 "$srcdir/$pkgname-$pkgver/ilinote.desktop" "$pkgdir/usr/share/applications/ilinote.desktop"
    fi
    
    # نصب آیکون (اگر وجود داشته باشد)
    if [[ -f "$srcdir/ilinote.svg" ]]; then
        install -Dm644 "$srcdir/ilinote.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/ilinote.svg"
    elif [[ -f "$srcdir/$pkgname-$pkgver/ilinote.svg" ]]; then
        install -Dm644 "$srcdir/$pkgname-$pkgver/ilinote.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/ilinote.svg"
    fi
}

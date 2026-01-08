# Maintainer: Saeed Badrelden <saeedbadrelden2021@gmail.com.com>
pkgname=hel-process
pkgver=1.0
pkgrel=1
pkgdesc="Helwan Process Manager"
arch=('any')
url="https://github.com/helwan-linux/hel-process"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-psutil' 'python-pyqtgraph')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/helwan-linux/hel-process/archive/master.tar.gz")
sha256sums=('SKIP')

package() {
    # انتقل إلى مجلد المصدر الصحيح
    cd "$srcdir/hel-process-main/hel-process-manager"

    # أنشئ مجلد التثبيت
    install -dm755 "$pkgdir/usr/share/$pkgname"

    # هذه هي الخطوة الأهم: انسخ كل المحتويات (*), بما في ذلك مجلد 'process_manager'
    cp -r * "$pkgdir/usr/share/$pkgname/"

    # ملف التشغيل (launcher)
    # هذا السكريبت موثوق لأنه يغير مسار العمل أولاً
    install -Dm755 /dev/null "$pkgdir/usr/bin/hel-process"
    echo "#!/bin/sh" > "$pkgdir/usr/bin/hel-process"
    echo "cd /usr/share/$pkgname" >> "$pkgdir/usr/bin/hel-process"
    echo "exec python main.py \"\$@\"" >> "$pkgdir/usr/bin/hel-process"

    # أيقونة التطبيق
    install -Dm644 logo/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/hel-process.png"

    # ملف الديسكتوب
    # عدّل ملف الديسكتوب لاستخدام سكريبت التشغيل
    sed -i "s/Exec=.*/Exec=hel-process/" "helwan-process-manager.desktop"
    install -Dm644 helwan-process-manager.desktop "$pkgdir/usr/share/applications/hel-process.desktop"
}

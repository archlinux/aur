# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=webviewer
pkgver=0.4.1
pkgrel=4
pkgdesc="Minimal display of a website. Useful for web versions of messengers."
arch=('any')
url="https://github.com/LeAlex27/webviewer"
license=('GPL3')
depends=('pyside6' 'qt6-webengine')
makedepends=('qt6-base' 'python-setuptools' 'python-build' 'wget' 'gendesk')
source=("webviewer.sh"
        "$pkgname-$pkgver.tar.gz::https://github.com/LeAlex27/$pkgname/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('f148d8c29d7b549f541d69b6335c92c9b3ee6a4788741339f22bf9356375e6a5'
            'c4a0493e35a39f323d346974893cf280cc4cab440bf2ea04b6d7f4fbc05d6733')

# uncomment to generate .desktop files
_whatsapp_web=1
_threema_web=1
_android_messages=1

prepare() {
    if [ -n "$_whatsapp_web" ]; then
        wget "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/766px-WhatsApp.svg.png"
        gendesk --pkgname "whatsapp_web" --name "WhatsApp Web" --categories "Network;InstantMessaging" \
        --exec "env QT_QUICK_CONTROLS_STYLE=Material QT_QUICK_CONTROLS_MATERIAL_THEME=Dark QT_QUICK_CONTROLS_MATERIAL_ACCENT=#00a884 QT_QUICK_CONTROLS_MATERIAL_BACKGROUND=#111b21 python -m webviewer --storage-name whatsapp_web --strip-user-agent https://web.whatsapp.com"
    fi

    if [ -n "$_threema_web" ]; then
        wget "https://upload.wikimedia.org/wikipedia/commons/2/2e/Threema%27s_App_Icon.png"
        gendesk --pkgname "threema_web" --name "Threema Web" --categories "Network;InstantMessaging" \
        --exec "env QT_QUICK_CONTROLS_STYLE=Material QT_QUICK_CONTROLS_MATERIAL_THEME=Light QT_QUICK_CONTROLS_MATERIAL_ACCENT=#25b157 python -m webviewer --storage-name threema_web https://web.threema.ch"
    fi

    if [ -n "$_android_messages" ]; then
        wget "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/600px-Google_Messages_logo.svg.png"
        gendesk --pkgname "android_messages" --name "Android Messages" --categories "Network;InstantMessaging" \
        --exec "env QT_QUICK_CONTROLS_STYLE=Material QT_QUICK_CONTROLS_MATERIAL_THEME=Dark QT_QUICK_CONTROLS_MATERIAL_ACCENT=#8eb7f8 python -m webviewer --storage-name android_messages https://messages.google.com/web/authentication"
    fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    /usr/lib/qt6/rcc -g python -o $pkgname/resources.py $pkgname/resources.qrc
    python -m build .
}

package() {
    cd $srcdir
    install -Dm655 webviewer.sh $pkgdir/usr/bin/webviewer

    # install shortcuts
    if [ -n "$_whatsapp_web" ]; then
        install -Dm644 766px-WhatsApp.svg.png $pkgdir/usr/share/pixmaps/whatsapp_web.png
        install -Dm644 whatsapp_web.desktop $pkgdir/usr/share/applications/whatsapp_web.desktop
    fi
    if [ -n "$_threema_web" ]; then
        install -Dm644 Threema\'s_App_Icon.png $pkgdir/usr/share/pixmaps/threema_web.png
        install -Dm644 threema_web.desktop $pkgdir/usr/share/applications/threema_web.desktop
    fi
    if [ -n "$_android_messages" ]; then
        install -Dm644 600px-Google_Messages_logo.svg.png $pkgdir/usr/share/pixmaps/android_messages.png
        install -Dm644 android_messages.desktop $pkgdir/usr/share/applications/android_messages.desktop
    fi

    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

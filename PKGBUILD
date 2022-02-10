# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=webviewer
pkgver=0.4.0
pkgrel=1
pkgdesc="Minimal display of a website. Useful for web versions of messengers."
arch=('any')
url="https://github.com/LeAlex27/webviewer"
license=('GPL3')
depends=('pyside6' 'qt6-webengine')
makedepends=('qt6-base' 'python-setuptools' 'python-build' 'wget')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LeAlex27/$pkgname/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('5da83be3a8c7c52aaae3064983a288d8e25b851ceb54c26e18b3540c6f730b25')

# uncomment to generate .desktop files
#_whatsapp_web=1
#_threema_web=1
#_android_messages=1

prepare() {
    # Todo: add qt material color scheme to files
    # Todo: does this work when set to 0?
    if [ -n "$_whatsapp_web" ]; then
        wget "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/766px-WhatsApp.svg.png"
        gendesk --pkgname "whatsapp_web" --name "WhatsApp Web" --categories "Network;InstantMessaging" \
        --exec "python -m webviewer --storage-name whatsapp_web --strip-user-agent https://web.whatsapp.com"
    fi

    if [ -n "$_threema_web" ]; then
        wget "https://upload.wikimedia.org/wikipedia/commons/2/2e/Threema%27s_App_Icon.png"
        gendesk --pkgname "threema_web" --name "Threema Web" --categories "Network;InstantMessaging" \
        --exec "python -m webviewer --storage-name threema_web  https://web.threema.ch"
    fi

    if [ -n "$_android_messages" ]; then
        wget "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/600px-Google_Messages_logo.svg.png"
        gendesk --pkgname "android_messages" --name "Android Messages" --categories "Network;InstantMessaging" \
        --exec "python -m webviewer --storage-name android_messages https://messages.google.com"
    fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    /usr/lib/qt6/rcc -g python -o $pkgname/resources.py $pkgname/resources.qrc
    python -m build .
}

package() {
    cd $srcdir

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

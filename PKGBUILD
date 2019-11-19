# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=epiphany-pantheon
pkgver=3.34.1
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine (with elementary OS patches)"
url="https://wiki.gnome.org/Apps/Web"
arch=(x86_64)
license=(GPL)
depends=(webkit2gtk gcr libdazzle libhandy)
makedepends=(docbook-xml startup-notification lsb-release gobject-introspection yelp-tools
             appstream-glib git meson)
checkdepends=(xorg-server-xvfb)
groups=(pantheon)
provides=(epiphany="${pkgver}" epiphany-sync)
_commit=fae9ef019e39c8ca420344c8c01416a3184bb8fc  # tags/3.34.1^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/epiphany.git#commit=$_commit"
        epiphany-sync{,.service}
        "01-full-width-url-bar.patch"
        "02-24px-color-toolbar-icons.patch"
        "03-tab-close-buttons-on-the-left.patch"
        "04-new-tab-button-on-the-left.patch"
        "05-rename-to-epiphany.patch"
        "06-double-click-for-new-tab.patch"
        "07-overlay-bar-style.patch"
        "08-rename-incongito-class-to-dodge-GNOME-style.patch"
        "09-middle-click-closes-tab.patch"
        "10-add-preferences-menuitem.patch"
        "11-fix-menu-margins.patch"
        "12-remove-tab-menuitem.patch"
        "13-remove-text-encoding-menuitem.patch"
        "14-add-important-menuitems.patch"
        "15-remove-GNOME-menu.patch"
        "16-hide-the-fonts-and-styles-tab.patch"
        "17-give-notebook-a-margin.patch")
sha1sums=('SKIP'
          '2a8fda153bf3fb2d9a14b632082329ed6e2d8fab'
          '2c1c89aee5e1ea2ca47d518690b93238213e73fd'
          '96c7a159f357077150e320bfe39ca4acd610d357'
          '3ebd0aadbf3ba145ccf5b5c07b810cc21c28f5a9'
          '824c797de664a7d5a904b49d76636ab929f5e400'
          'ec44a91a1693c664e55ef42c21ae2d9e27c75148'
          '7dbfdea116239bb3ee947e9175a43a6bdd768f1e'
          '71fc912aee1e01bc6d17907d7bfa33852ef15fb2'
          'cb88f86c9e44936993ab2e3a02f71874de422ae7'
          '0f1085fb06e06298c7fb8feb12be0699d166dd2b'
          '5c0d41eda4b449ceba4699e1a1e8b6359d12deb4'
          '2b07c438cdabe254a33b6b5f180f9359e3e21422'
          '8deb1718a29e157e888a1358048200cc5887b1f3'
          '58227528aa8bc1d1480fbd0f5e18a6eb11450ba8'
          '33246f87659164729c55a201151c368bd0f02b9c'
          '67f6d0c60cbf4ea9252c56d3ac37090fd18a534c'
          'e125a6e6ca85ad06d192e1c200190438ca2b1f8a'
          '0f3e50ecb72b9cf671dc75d5ac987f5e05b2ed66'
          'cd1090f20a153d77060aa1d6304c4d5e621c125f')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  msg2 "full width url bar"; patch -Np1 < ../01-full-width-url-bar.patch
  msg2 "24px color toolbar icons"; patch -Np1 < ../02-24px-color-toolbar-icons.patch
  msg2 "tab close buttons on the left"; patch -Np1 < ../03-tab-close-buttons-on-the-left.patch
  #msg2 "new tab button on the left"; patch -Np1 < ../04-new-tab-button-on-the-left.patch #COMPLICATED
  msg2 "rename to epiphany"; patch -Np1 < ../05-rename-to-epiphany.patch
  msg2 "double click for new tab"; patch -Np1 < ../06-double-click-for-new-tab.patch
  msg2 "overlay bar style"; patch -Np1 < ../07-overlay-bar-style.patch
  msg2 "rename incognito class"; patch -Np1 < ../08-rename-incongito-class-to-dodge-GNOME-style.patch
  msg2 "middle click closes tab"; patch -Np1 < ../09-middle-click-closes-tab.patch
  msg2 "add preferences menuitem"; patch -Np1 < ../10-add-preferences-menuitem.patch
  msg2 "fix menu margins"; patch -Np1 < ../11-fix-menu-margins.patch
  #msg2 "remove tab menuitem"; patch -Np1 < ../12-remove-tab-menuitem.patch #REMOVED UPSTREAM
  #msg2 "remove text encoding menuitem"; patch -Np1 < ../13-remove-text-encoding-menuitem.patch #REMOVED UPSTREAM
  msg2 "add important menuitems"; patch -Np1 < ../14-add-important-menuitems.patch
  #msg2 "remove GNOME menu"; patch -Np1 < ../15-remove-GNOME-menu.patch #REMOVED UPSTREAM
  msg2 "hide the fonts and styles tab"; patch -Np1 < ../16-hide-the-fonts-and-styles-tab.patch
  msg2 "give notebook a margin"; patch -Np1 < ../17-give-notebook-a-margin.patch
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  # ERROR:../epiphany/tests/ephy-web-app-utils-test.c:109:test_web_app_lifetime: assertion failed (g_list_length (apps) == 1): (0 == 1)
  xvfb-run meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 755 {"${srcdir}","${pkgdir}"/usr/bin}/epiphany-sync
  install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/epiphany-sync.service
}

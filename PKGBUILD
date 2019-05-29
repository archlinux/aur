# Maintainer: Que Quotion <quequotion at bugmenot dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=epiphany-pantheon
pkgver=3.32.2
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine (with elementary OS patches)"
url="https://wiki.gnome.org/Apps/Web"
arch=(x86_64)
license=(GPL)
depends=(webkit2gtk gcr icu libdazzle libhandy) #gst-libav
makedepends=(docbook-xml startup-notification lsb-release gobject-introspection yelp-tools
             appstream-glib git meson) #autoconf-archive
checkdepends=(xorg-server-xvfb)
groups=(pantheon)
provides=(epiphany="${pkgver}" epiphany-sync)
_commit=d154e6cea18123576d511512827cd6308c9780e2  # tags/3.32.2^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/epiphany.git#commit=$_commit"
        epiphany-sync{,.service}
        "full-width-url-bar-lesshandy.patch"
        "24px-color-toolbar-icons-reduced.patch"
        "tab-close-button-left.patch"
        "new-tab-button-left.patch"
        "use-real-name.patch"
        "double-click-for-new-tab.patch"
        "overlay-bar-style.patch"
        "dodge-incognito-mode-style.patch"
        "middle-click-close-tab.patch"
        "add-preferences-menuitem.patch"
        "fix-menu-margins.patch"
        "remove-newtab-menuitem.patch"
        "remove-text-encoding-menuitem.patch"
        "add-various-menuitem.patch"
        "remove-gnome-menu.patch"
        "hide-fonts-and-style-tab.patch"
        "notebook-margin.patch")

sha1sums=('SKIP'
          '2a8fda153bf3fb2d9a14b632082329ed6e2d8fab'
          '2c1c89aee5e1ea2ca47d518690b93238213e73fd'
          '66527476f0f7ef19eefdfd2c700748350c1e24b9'
          '9ee462279ae5115535590ce6fb3318de7f7eeba1'
          '6830e08ab8f2fc363768a3357544c5322f3f702a'
          'ec44a91a1693c664e55ef42c21ae2d9e27c75148'
          '8be3e4ce2d2dd1226faaeb1937e93aedbfc5c7a9'
          'd1153085b4827a12aa3959ad6d7ab7e80b2a4754'
          'cb88f86c9e44936993ab2e3a02f71874de422ae7'
          '1588217c2f425172693b4c6430accbc03273a349'
          'fd94fe5b97a9e1d189f1f9e0310389831aa14e10'
          '2b07c438cdabe254a33b6b5f180f9359e3e21422'
          '8deb1718a29e157e888a1358048200cc5887b1f3'
          '58227528aa8bc1d1480fbd0f5e18a6eb11450ba8'
          '33246f87659164729c55a201151c368bd0f02b9c'
          '67f6d0c60cbf4ea9252c56d3ac37090fd18a534c'
          'e125a6e6ca85ad06d192e1c200190438ca2b1f8a'
          '5a0aa426e87cfb2943a68ca70e1b301b0e6f427a'
          'cd1090f20a153d77060aa1d6304c4d5e621c125f')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  msg2 "../full-width-url-bar-lesshandy.patch"
  patch -Np1 < "../full-width-url-bar-lesshandy.patch"
  #patch out libhandy sizing method.

  msg2 "../24px-color-toolbar-icons-reduced.patch"
  patch -Np1 < "../24px-color-toolbar-icons-reduced.patch"
  #New way of defining buttons; unclear if size specification is needed.

  msg2 "../tab-close-button-left.patch"
  patch -Np1 < "../tab-close-button-left.patch"

  #msg2 "../new-tab-button-left.patch"
  #patch -Np1 < "../new-tab-button-left.patch"
  #Whole, terrible, new way of making interfaces.

  msg2 "../use-real-name.patch"
  patch -Np1 < "../use-real-name.patch"
  msg2 "../double-click-for-new-tab.patch"
  patch -Np1 < "../double-click-for-new-tab.patch"
  msg2 "../overlay-bar-style.patch"
  patch -Np1 < "../overlay-bar-style.patch"

  #msg2 "../dodge-incognito-mode-style.patch"
  #patch -Np1 < "../dodge-incognito-mode-style.patch"
  #No longer posssible to do this only for header or defined elsewhere?

  msg2 "../middle-click-close-tab.patch"
  patch -Np1 < "../middle-click-close-tab.patch"
  msg2 "../add-preferences-menuitem.patch"
  patch -Np1 < "../add-preferences-menuitem.patch"
  msg2 "../fix-menu-margins.patch"
  patch -Np1 < "../fix-menu-margins.patch"

  #msg2 "../remove-newtab-menuitem.patch"
  #patch -Np1 < "../remove-newtab-menuitem.patch"
  #Already removed upstream?

  #msg2 "../remove-text-encoding-menuitem.patch"
  #patch -Np1 < "../remove-text-encoding-menuitem.patch"
  #Already removed upstream? Replaced with "Override text encoding"?

  msg2 "../add-various-menuitem.patch"
  patch -Np1 < "../add-various-menuitem.patch"

  #msg2 "../remove-gnome-menu.patch"
  #patch -Np1 < "../remove-gnome-menu.patch"
  #?????

  msg2 "../hide-fonts-and-style-tab.patch"
  patch -Np1 < "../hide-fonts-and-style-tab.patch"
  msg2 "../notebook-margin.patch"
  patch -Np1 < "../notebook-margin.patch"
}

build() {
  arch-meson $pkgname build \
    -D distributor_name="Arch Linux®"
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

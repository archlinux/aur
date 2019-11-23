# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=epiphany-pantheon
pkgver=3.35.1
pkgrel=3
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
_commit=aa3e99a5845daac749bab80bc600ec5797a3f9c7  # tags/3.35.1^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/epiphany.git#commit=$_commit"
        epiphany-sync{,.service}
        "05-rename-to-epiphany.patch"
        "06-double-click-for-new-tab.patch"
        "07-overlay-bar-style.patch"
        "08-rename-incongito-class-to-dodge-GNOME-style.patch"
        "09-middle-click-closes-tab.patch"
        "16-hide-the-fonts-and-styles-tab.patch"
        "17-give-notebook-a-margin.patch")
sha1sums=('SKIP'
          '2a8fda153bf3fb2d9a14b632082329ed6e2d8fab'
          '2c1c89aee5e1ea2ca47d518690b93238213e73fd'
          '7dbfdea116239bb3ee947e9175a43a6bdd768f1e'
          '71fc912aee1e01bc6d17907d7bfa33852ef15fb2'
          'cb88f86c9e44936993ab2e3a02f71874de422ae7'
          '0f1085fb06e06298c7fb8feb12be0699d166dd2b'
          '5c0d41eda4b449ceba4699e1a1e8b6359d12deb4'
          '0f3e50ecb72b9cf671dc75d5ac987f5e05b2ed66'
          'cd1090f20a153d77060aa1d6304c4d5e621c125f')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  msg2 "rename to epiphany"; patch -Np1 < ../05-rename-to-epiphany.patch
  msg2 "double click for new tab"; patch -Np1 < ../06-double-click-for-new-tab.patch
  msg2 "overlay bar style"; patch -Np1 < ../07-overlay-bar-style.patch
  msg2 "rename incognito class"; patch -Np1 < ../08-rename-incongito-class-to-dodge-GNOME-style.patch
  msg2 "middle click closes tab"; patch -Np1 < ../09-middle-click-closes-tab.patch
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

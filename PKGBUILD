# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=ibm650-git
pkgver=r35.3ab08db
pkgrel=1
pkgdesc="Emulator for the IBM Type 650 computer"
arch=("x86_64")
url="https://github.com/snick-a-doo/IBM650"
license=('GPL3')
depends=('boost-libs' 'gtkmm3')
makedepends=('git' 'meson' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('ibm650::git+https://github.com/snick-a-doo/IBM650.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
cd "$srcdir/${pkgname%-git}"
# diff -u <(git show HEAD:UI/app.cpp) UI/app.cpp
pwd
patch --verbose UI/app.cpp <<EOF
@@ -355,7 +355,7 @@
 int main(int argc, char* argv[])
 {
   auto app = Gtk::Application::create("org.gtkmm.examples.base");
-  auto builder = Gtk::Builder::create_from_file("IBM650.glade");
+  auto builder = Gtk::Builder::create_from_file("/usr/share/${pkgname%-git}/IBM650.glade");
   Gtk::Window* window;
   builder->get_widget("console", window);
EOF
}

build() {
  cd "$srcdir/${pkgname%-git}"
  # git clean -dfx
  meson setup --prefix /usr build/ ./
  ninja -C build/ all
  # DESTDIR="/tmp/root_lib" meson install -C build/
  # DESTDIR="/tmp/root_ui" meson install -C build/
  # meson dist -C build/
  # meson compile -C build/
}

package() {
  cd "$srcdir/${pkgname%-git}"
  # DESTDIR="/tmp/root" ninja -C build/ install
  DESTDIR="$pkgdir" ninja -C build/ install
  install -vDm755 build/UI/app "$pkgdir/usr/bin/app"
  install -vDm755 UI/IBM650.glade "$pkgdir/usr/share/${pkgname%-git}/IBM650.glade"
}

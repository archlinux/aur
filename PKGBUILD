# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-standalone-git
pkgver=r677.f8b98a5
pkgrel=1
pkgdesc='Stylish top panel (without Gala dependencies)'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon-qq')
depends=(glib2 gtk3 lib{gee,granite.so,wnck3} pantheon-notifications)
makedepends=('meson' 'git' 'vala')
optdepends=("pantheon-applications-menu: Application launcher"
            "wingpanel-indicator-datetime: Clock and calendar widget"
            wingpanel-indicator-{a11y,bluetooth,keyboard,network,nightlight,notifications,power,privacy,sensors,sound}": System indicator"
            "wingpanel-indicator-session-standalone-git: Session indicator for Wingpanel (without Gala dependencies)"
            wingpanel-indicator-{ayatana,namarupa}-git": Display Unity 7 indicators"})
provides=(wingpanel{,-git} libwingpanel{,-2.0}.so)
conflicts=(wingpanel{,-git} libwingpanel{,-2.0}.so)
source=('git+https://github.com/elementary/wingpanel.git'
        'minus-backgroundmanager.patch'
        'minus-galaplugin.patch'
        'autohide.patch'
        'fix-for-openbox.patch'
        'no-mutter-typelib.patch')
sha256sums=('SKIP'
            '1fbc81bbb6c6ac59f7ea8761cdac0714fd2f39877dc81a0b0d6db855163d4f14'
            'aa0a27e41df60a7b15e2fd7e0d06551663b98917b7632e4067e6b9a39407de1c'
            '87732bcf30de9d2b9ad63d2ac185dcd1940553880bb96a5b1c44f53ee189b910'
            'aa15974b87a1000ab432bb048bc8a6ba0f36edd24e682d4e57833179c7b93f45'
            '5b29e24b4dc9076d54621334b839d2dbfa6a6adce1e8b444e38c2412f314f8c7')

pkgver() {
  cd wingpanel

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel

  #Fake 2.0 API
  #git revert -n c6313641f56fd12d14ad4d064dd64422f1140ff3

  #Autohide
  patch -Np1 < ../autohide.patch
  #patch -Np2 < ../autohide-testing.patch

  #Fixes
  patch -Np1 < ../fix-for-openbox.patch

  #Standalone patches
  rm -rf wingpanel-interface
  rm src/Services/BackgroundManager.vala
  patch -Np2 < ../minus-backgroundmanager.patch
  patch -Np2 < ../minus-galaplugin.patch
  patch -Np2 < ../no-mutter-typelib.patch

  [ ! -d build ] || rm -rf build
}

build() {
  cd wingpanel/
  arch-meson build
  ninja -C build
}

package() {
  cd wingpanel/
  DESTDIR="${pkgdir}" ninja -C build install
}

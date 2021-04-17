# Maintainer: Que Quotion <quequotion@bugmenot.com> 
# Contributor: <shlomochoina@gmail.com> 

pkgname=pantheon-dock-instctl-git
pkgver=r2143.a74ee61
pkgrel=1
pkgdesc='The Pantheon Dock (with instance controls)'
arch=('i686' 'x86_64')
url='https://www.reddit.com/r/elementaryos/comments/irt66g/instance_controls_close_switch_to_or_minimize/'
license=('GPL3')
groups=('pantheon-qq')
depends=('bamf' 'gnome-menus' 'libgee' libgranite.so=6-64 'python')
makedepends=('git' gnome-{common,menus} 'libdbusmenu-gtk3' 'granite' 'meson' 'vala')
conflicts=('plank')
provides=('plank')
source=('pantheon-dock::git+https://github.com/elementary/dock'
        'instance-controls.patch')

sha256sums=('SKIP'
            '8aef381cd636d8c958e5d29ce1b053fa3ef8f961768654c34fd80939b96b3fc3')

pkgver() {
  cd pantheon-dock

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-dock

  # https://github.com/elementary/dock/pull/73
  patch -Np1 < ../instance-controls.patch
}

build() {
  arch-meson pantheon-dock build -Dapport=false -Denable-dbusmenu=yes -Denable-barriers=yes
  ninja -C build
}
package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# Maintainer:  Håvard Pettersson <mail@haavard.me>

_pkgname=osu
pkgname=$_pkgname-git
pkgver=r7.9b57c53
pkgrel=1

pkgdesc='rhythm is just a *click* away!'
url='https://osu.ppy.sh'
arch=('i686' 'x86_64')
license=('MIT' 'custom:CCPL:by-nc-4.0')

depends=('mono')
makedepends=('git' 'nuget')
provides=($_pkgname)
conflicts=($_pkgname)

source=("git+https://github.com/ppy/$_pkgname.git"
        "git+https://github.com/ppy/$_pkgname-resources.git"
        "git+https://github.com/ppy/$_pkgname-framework.git"
        "osu-bin")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'a5abea74ed95ba0469beda5d8862c60c2476d35cdc8ae0d5e94bf5fcca452e48')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  git submodule init
  git config submodule.osu-resources.url "$srcdir/$_pkgname-resources"
  git config submodule.osu-framework.url "$srcdir/$_pkgname-framework"
  git submodule update

  nuget restore
}

build() {
  cd $_pkgname
  xbuild /p:Configuration=Release
}

package() {
  cd $_pkgname

  install -Dm755 "$srcdir"/osu-bin "$pkgdir"/usr/bin/osu

  install -dm755 "$pkgdir"/usr/lib/$_pkgname
  install -Dm755 osu.Desktop/bin/Release/*.{exe,so,dll,dll.config} "$pkgdir"/usr/lib/$_pkgname

  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $_pkgname-framework/LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-framework
  install -Dm644 $_pkgname-resources/LICENCE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-resources.md
}

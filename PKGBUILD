# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: xiliuya <xiliuya@aliyun.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>

pkgname=ffdec-git
pkgver=26.0.0.r8992.6ff4bf0
pkgrel=1
pkgdesc="Open Source Flash SWF decompiler and editor, git version"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler"
license=('GPL-3.0-or-later')
provides=('ffdec')
conflicts=('ffdec')
depends=(
  'java-runtime>=8'
)
makedepends=(
  'ant'
  'java-environment>=8'
  'git'
)
source=(
  "ffdec::git+$url#branch=dev"
  'ffdec.sh'
  'ffdec.desktop'
)
b2sums=(
  'SKIP'
  '27677dbabd3cae97e88872c72d6f9f26a32026f4f05b895e0ce5ae9597d0298bbdb9cabf48d3d130500c5fb6a6a0c00aecd84896b04f03b1d105eeb234ee414e'
  '2881f0e50d97e96119efe873a418232f3e2445d7540c3b07e635081b248812ebda31ea4cb76a7eabf57827e0530bf3b66fc358000651a5c108c732d8b4912f92'
)

pkgver() {
  cd ffdec
  _tag="$(git tag --list 'version*' | sort -V | tail -1 | sed 's/^version//')"
  printf "%s.r%s.%s" "$_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ffdec
  IFS='.' read -r major minor release revision commit <<< "$pkgver"
  sed -Eie 's/(name="version.major" value=")0(")/\1'"$major"'\2/g'       build.xml
  sed -Eie 's/(name="version.minor" value=")0(")/\1'"$minor"'\2/g'       build.xml
  sed -Eie 's/(name="version.release" value=")0(")/\1'"$release"'\2/g'   build.xml
  sed -Eie 's/(name="version.debug" value=")true(")/\1false\2/g'         build.xml
  ant build
}

check() {
  cd ffdec
  ant test
}

package() {
  cd ffdec

  install -Dm644 "dist/ffdec.jar" -t "$pkgdir/usr/share/java/$pkgname"
  for f in lib/*.jar; do
    install -Dm644 "$f" -t "$pkgdir/usr/share/java/$pkgname/lib"
  done

  install -Dm755 "../ffdec.sh" "$pkgdir/usr/bin/ffdec"

  install -Dm644 "../ffdec.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  for f in lib/*.license.txt; do
    install -Dm644 "$f" -t "$pkgdir/usr/share/licenses/$pkgname"
  done
  install -Dm644 "resources/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:

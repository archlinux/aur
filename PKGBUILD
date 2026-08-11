# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: xiliuya <xiliuya@aliyun.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>

pkgname=ffdec-git
pkgver=26.2.1.r9104.b0002c6
pkgrel=1
pkgdesc="Open Source Flash SWF decompiler and editor, git version"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler"
license=('GPL-3.0-or-later')
provides=('ffdec')
conflicts=('ffdec')
depends=(
  'java-runtime>=8'
  'bash'
)
makedepends=(
  'ant'
  'java-environment>=8'
  'git'
)
source=(
  "ffdec::git+$url#branch=dev"
  'ffdec.desktop'
)
b2sums=(
  'SKIP'
  '8219c7198174dfd0ee66904a40cd448d43389dde9310e018d07a919590b603579bc8a0baf19361111a29706289f5f51939897a3ef60295ba5c4a7dc656133723'
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

  install -Dm0644 "dist/ffdec.jar" -t "$pkgdir/usr/share/java/$pkgname"
  for f in lib/*.jar; do
    install -Dm0644 "$f" -t "$pkgdir/usr/share/java/$pkgname/lib"
  done

  install -Dm0755 "dist/ffdec.sh" "$pkgdir/usr/bin/ffdec"

  install -Dm0644 "../ffdec.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm0644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/ffdec.png"
  install -Dm0644 "resources/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ffdec.png"

  for f in lib/*.license.txt; do
    install -Dm0644 "$f" -t "$pkgdir/usr/share/licenses/$pkgname"
  done
  install -Dm0644 "resources/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 "dist/com.jpexs.decompiler.flash.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
}
# vim: ts=2 sw=2 et:

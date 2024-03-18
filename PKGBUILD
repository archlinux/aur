# Maintainer:
# Contributor: Jonas Witschel <diabonas@archlinux.org>

# options
: ${_jrever:=8}
: ${_jdkver:=17}

: ${_build_git:=true}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="pdftk"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=3.3.3.r17.gd0d4a0b
pkgrel=1
pkgdesc="Command-line tool for working with PDFs"
url="https://gitlab.com/pdftk-java/pdftk"
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  "bcprov"
  "java-commons-lang"
  "java-runtime-headless>=${_jrever:-8}"
)
makedepends=(
  "git"
  "gradle"
  "jdk${_jdkver}-openjdk"
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | sort -rV | head -1)
  local _version="${_tag#v}"
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  [ -n "$_jdkver" ] && export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  [ -n "$_jdkver" ] && export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  :
}

build() {
  cd "$_pkgsrc"
  gradle -Dorg.gradle.daemon=false build
}

check() {
  cd "$_pkgsrc"
  gradle -Dorg.gradle.daemon=false test
}

package() {
  cd "$_pkgsrc"
  install -Dm644 build/libs/pdftk.jar -t "$pkgdir/usr/share/java/$_pkgname"
  install -Dm644 pdftk.1 -t "$pkgdir/usr/share/man/man1"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pdftk" <<END
#!/usr/bin/env bash
CP='/usr/share/java/bcprov/bcprov.jar:/usr/share/java/commons-lang/commons-lang.jar:/usr/share/java/$_pkgname/pdftk.jar'
exec /usr/bin/java -cp "\$CP" com.gitlab.pdftk_java.pdftk "\$@"
END
}

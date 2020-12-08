# Maintainer: Aiyion <aur@aiyionpri.me>
_pkgname=minimaxsimulator
pkgname=$_pkgname-git
pkgver=v2.0.0.r4.gd234ffa
pkgrel=3
pkgdesc="a platform independent GUI-based Minimax simulator written in Java"
arch=('any')
url="https://github.com/luhsra/MinimaxSimulator"
license=('MIT')
groups=()
depends=('bash' 'java-runtime>=11')
makedepends=('git' 'java-environment>=11' 'maven>=3.0.5')
checkdepends=()
optdepends=('libcanberra: for smoother GUI')
provides=('minimaxsimulator-git')
conflicts=('minimaxsimulator')
replaces=()
backup=()
options=()
install=
changelog=
source=(
        "git+https://github.com/luhsra/$_pkgname.git"
        "minimaxsimulator.desktop"
        "minimaxsimulator.sh"
)
noextract=()
sha512sums=('SKIP'
            '9d2abb18a4ff60fa9734367fcba2bc7e3b6fecda1b8437ec5e0a8b3e5c9968cf8d9b04212e135d1e846b59e761530034796c85282446a111b706b7be61158761'
            '3cc9c22697828818fa2c8b5c805c5e672b998666208a66d138b96d0b4457964db3e4ea8ee06accd326f304ef79574435a9c29daf017bddf953b99a7ce169d8be')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
        cd "$_pkgname"
        mvn clean package
}

package() {
	baseversion=$(echo $pkgver | sed 's/^v//;s/\.r.*$//')
        cd "$_pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "target/minimax_simulator-$baseversion-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$_pkgname/minimax_simulator.jar"
        install -d "$pkgdir/usr/bin"
        install -Dm755 "$srcdir/minimaxsimulator.sh" "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 "$srcdir/minimaxsimulator.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
        install -Dm644 exe-icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}


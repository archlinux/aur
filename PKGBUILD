# Maintainer: zfo <zfoofz1@gmail.com>
pkgname=gatk-git
_pkgname=gatk
pkgver=r1.e91472d
pkgrel=1
pkgdesc="Analysis of high-throughput sequencing data"
arch=('any')
url="https://www.broadinstitute.org/gatk/"
license=('MIT')
groups=()
depends=('java-runtime-common' 'maven')
makedepends=('git')
provides=('gatk')
conflicts=('gatk')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/broadgsa/gatk-protected
_gitname=gatk

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  mvn install
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/share/${_pkgname}"
  install -m 0644 README.md "$pkgdir/usr/share/${_pkgname}/README.md"
  install -d "$pkgdir/usr/share/${_pkgname}/licensing"
  install -m 0644 licensing/* "$pkgdir/usr/share/${_pkgname}/licensing"
  install -m 0644 target/GenomeAnalysisTK.jar "$pkgdir/usr/share/${_pkgname}/"
  install -m 0644 target/Queue.jar "$pkgdir/usr/share/${_pkgname}/"
  install -d "$pkgdir/usr/bin"
  echo "java -jar /usr/share/${_pkgname}"'/GenomeAnalysisTK.jar "$@"' > "$pkgdir/usr/bin/gatk"
  echo "java -jar /usr/share/${_pkgname}"'/Queue.jar "$@"' > "$pkgdir/usr/bin/gatk-queue"
  chmod 0755 "$pkgdir/usr/bin/gatk"
  chmod 0755 "$pkgdir/usr/bin/gatk-queue"
}

# vim:set ts=2 sw=2 et:

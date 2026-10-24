# Maintainer: ictye <northgreen2006 at qq dot com>
pkgname=ez2lazer-git
url='https://github.com/SK-la/Ez2Lazer'
pkgrel=2
pkgver=2026.1023.0.ez2lazer.r4.gb4124d6a21
pkgdesc='Ez to Lazer(Pursue the Ez2Ac style in the lazer)做一个炫酷的客户端'
arch=("x86_64")
license=("MIT")
options=('!debug')
depends=(
  'ffmpeg4.4'
  'lttng-ust2.12')
makedepends=(
  'dotnet-sdk-10.0'
  'git'
  'python')
source=(
  'osu::git+https://github.com/SK-la/Ez2Lazer.git#branch=master'
  'ez2lazer-framework::git+https://github.com/SK-la/ez2lazer-framework.git#branch=master'
  'ez2lazer-resources::git+https://github.com/SK-la/ez2lazer-resources.git#branch=master'
  'osu-ez2lazer'
  'osu-ez2lazer.desktop'
  'lazer.png')
conflicts=(ez2lazer ez2lazer-bin)
sha256sums=('SKIP'
  'SKIP'
  'SKIP'
  'a3f9ed38e65e5ce1b89c7df53d4139ade3af7eb0e379ef61a2a69a128d8bcbde'
  '17a504de02a94727584e77c90d93b6bf072dd40f339e05fb2df038f67d9a9d6d'
  '30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51')

pkgver() {
  cd osu
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export MSBuildEnableWorkloadResolver=false
}

build() {
  # echo "Using DOTNET_CLI_HOME:$DOTNET_CLI_HOME"
  chmod +x $srcdir/osu/publish-linux.py

  if ! $srcdir/osu/publish-linux.py --no-zip --outroot $srcdir; then
    echo "An ERROR happend in publish,you can report it on AUR"
    exit 1
  fi

}

package() {
  mkdir -p "$pkgdir"/opt/osu-ez2lazer
  cp -dr --no-preserve=ownership "$srcdir"/artifacts/Ez2Lazer_release_linux_x64/* "$pkgdir"/opt/osu-ez2lazer
  install -D -m755 osu-ez2lazer "$pkgdir"/usr/bin/osu-ez2lazer

  install -D -m644 osu-ez2lazer.desktop "$pkgdir"/usr/share/applications/osu-ez2lazer.desktop
  install -D -m644 lazer.png "$pkgdir"/usr/share/pixmaps/ez2lazer.png
  install -Dm644 "$srcdir/osu/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}

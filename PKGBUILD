# Upstream: Files by Files Community (https://github.com/files-community/Files); this is the unofficial LinuxFiles fork.
# Developer: LinuxFiles contributors (fork of Files by Files Community)
# Maintainer: MemerGamer <kovacsbalinthunor13@gmail.com>
# Binary package: repackages the self-contained release tarball built by .github/workflows/package-linux.yml.
# Regenerate checksums and .SRCINFO for a release with scripts/linux/gen-aur.sh.
pkgname=linuxfiles-bin
_pkgname=linuxfiles
_tag=0.1.0-alpha1
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc='LinuxFiles, Files for Linux: unofficial port of Files by the Files Community (Uno Platform), prebuilt binaries'
arch=('x86_64')
url='https://github.com/MemerGamer/LinuxFiles'
license=('MIT')
# The runtime is bundled; these are the native libraries Skia/Uno load at runtime.
depends=('fontconfig' 'freetype2' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libxext' 'mesa' 'glib2' 'hicolor-icon-theme')
optdepends=('polkit: authenticated root actions'
            'gvfs: network and MTP locations'
            'udisks2: mount and eject drives'
            'libsecret: saved network credentials (Secret Service provider)'
            'gnome-disk-utility: format and manage drives')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')  # stripping breaks the self-contained .NET binaries
_base="$url/releases/download/linux-v$_tag"
source=("$pkgname-$pkgver.tar.gz::$_base/files-linux-x64.tar.gz"
        "$pkgname-packaging-$pkgver.tar.gz::$_base/files-packaging.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz" "$pkgname-packaging-$pkgver.tar.gz")
sha256sums=('fe6144bc6feafa03d1c4c4fc4ce45afd5ec2c78836a036bd746533e6240af6ad'
            '973496ee2c5124bc56f5980333bf6de88e76064b81f6c3d9aeb9314df3024aba')  # scripts/linux/gen-aur.sh fills these in

prepare() {
  mkdir -p app packaging
  bsdtar -xf "$pkgname-$pkgver.tar.gz" -C app --strip-components=1
  bsdtar -xf "$pkgname-packaging-$pkgver.tar.gz" -C packaging
}

package() {
  local id=io.github.memergamer.LinuxFiles

  install -dm755 "$pkgdir/usr/lib/$_pkgname"
  cp -a app/. "$pkgdir/usr/lib/$_pkgname/"
  install -Dm755 app/elevation-helper/files-elevation-helper "$pkgdir/usr/lib/linuxfiles/files-elevation-helper"
  rm -rf "$pkgdir/usr/lib/$_pkgname/elevation-helper"
  install -Dm644 packaging/linux/io.github.memergamer.LinuxFiles.root-actions.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.github.memergamer.LinuxFiles.root-actions.policy"
  # The launcher finds /usr/lib/linuxfiles/Files.dll on its own.
  install -Dm755 packaging/linux/files "$pkgdir/usr/bin/files"

  install -Dm644 "packaging/linux/$id.desktop" "$pkgdir/usr/share/applications/$id.desktop"
  install -Dm644 "packaging/linux/$id.metainfo.xml" "$pkgdir/usr/share/metainfo/$id.metainfo.xml"
  for s in 16 24 32 48 64 128 256 512; do
    install -Dm644 "packaging/linux/icons/hicolor/${s}x${s}/apps/$id.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/$id.png"
  done
  install -Dm644 packaging/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=nextcloud-native-bin
pkgver=0.1.0alpha.2
pkgrel=1
pkgdesc="Adaptive native client for Nextcloud files, media and apps (upstream binary)"
arch=('x86_64')
url="https://nc-native.obiente.dev"
license=('AGPL-3.0-or-later')
# jpackage bundles its own Java runtime, so these are the shared libraries the
# upstream .deb declares plus libsecret, whose secret-tool the client calls to
# store account credentials in the Secret Service.
depends=('alsa-lib' 'brotli' 'bzip2' 'expat' 'fontconfig' 'freetype2'
         'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libbsd' 'libglvnd' 'libmd'
         'libpng' 'libsecret' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext'
         'libxi' 'libxrender' 'libxtst' 'xdg-utils' 'zlib')
optdepends=('gnome-keyring: Secret Service provider for stored accounts'
            'kwallet: Secret Service provider for stored accounts on Plasma'
            'fuse2: mount an account as a virtual file system')
provides=('nextcloud-native')
conflicts=('nextcloud-native')
options=('!strip' '!debug')
# Upstream has no stable release yet: every release is a prerelease, and the
# repository also carries per-build nightly-* and rolling channel-* releases.
# Only the versioned tags are packaged, and their asset names embed a build
# number that cannot be derived from pkgver - both are refreshed automatically.
_tag="v0.1.0-alpha.2"
_asset="nextcloudnative_1.0.3822_amd64.deb"
source=("${pkgname}-${pkgver}.deb::https://github.com/Obiente/nc-native/releases/download/${_tag}/${_asset}")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('df8e3e616c79c4ce3f7597fa9b88c188a956475f2af4128bc7a70692ebf39325')

package() {
  # jpackage app image (bundled JRE) in /opt plus the desktop entry, icon and
  # AppStream metadata upstream adds to the .deb
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" --exclude './usr/share/doc' ./opt ./usr

  # the launcher resolves its own directory through /proc/self/exe, so a
  # symlink into /usr/bin keeps the app image self-contained
  install -d "$pkgdir/usr/bin"
  ln -s /opt/nextcloudnative/bin/NextcloudNative "$pkgdir/usr/bin/nextcloud-native"

  install -Dm644 "$pkgdir/opt/nextcloudnative/share/doc/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # The in-app updater only engages where dpkg or rpm reports the package as
  # installed; on Arch it stays inert and updates come through pacman.
}

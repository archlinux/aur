# Maintainer: Tashila Pathum <neomusicapp@gmail.com>
#
# The AUR recipe, pushed to aur.archlinux.org/neomusic.git together with the .SRCINFO beside it.
# The desktop source is not public, so this fetches the published release tarball and copies it
# into place — there is no build(). packaging/arch/PKGBUILD is the other recipe: it builds from a
# local checkout, for testing an install of an unreleased build.

pkgname=neomusic
# Mirrors neomusic.version in gradle.properties; VersionSyncTest fails if the two disagree.
# A repackage of the same app version bumps pkgrel, not pkgver.
pkgver=0.1.0
pkgrel=1
pkgdesc="Retro CD-player music app with a cyberpunk LCD UI"
url="https://neomusic.tashila.me"
arch=('x86_64')
license=('LicenseRef-NeoMusic')
# Kept equal to packaging/arch/PKGBUILD by PackageMetadataSyncTest; the reasoning for the list,
# and for what namcap reports that is deliberately left out, is there.
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly'
         'gst-libav' 'libglvnd' 'libx11' 'fontconfig' 'libxext' 'libxi' 'libxrender' 'libxtst'
         'zlib' 'hicolor-icon-theme')
options=('!strip')  # the app image is a jlink runtime; re-stripping it can break the JVM image
# Desktop releases are tagged linux-v<ver>: the repo's v* tags belong to the Android app.
_release="https://github.com/tashilapathum/NeoMusic/releases/download/linux-v$pkgver"
source=("$_release/$pkgname-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('be00c48727c8520d9708dd966fb8c6cc4db3a798b128fa17ca51ba78ae32fa5e')

package() {
  # The tarball is already the installed tree: /opt/neomusic, the /usr/bin/neomusic wrapper, the
  # desktop entry, the MIME globs, the hicolor icons and /usr/share/licenses/neomusic. cp -a keeps
  # the jlink runtime's file modes.
  cp -a "$srcdir/$pkgname-$pkgver"/{opt,usr} "$pkgdir"/
}

#Maintainer: Leonard König <leonard dot r dot koenig at googlemail dot com>
pkgname=unity-editor
_pkgver=5.1.0f3
pkgver=${_pkgver}+2015082501
pkgrel=3
pkgdesc="A cross-platform game engine used to develop video games for PC, consoles, mobile devices and websites. Linux Preview package"
arch=('x86_64')
url="https://unity3d.com"
license=('custom')
depends=('libstdc++5' 'lib32-libstdc++5' 'lib32-gcc-libs' 'alsa-lib' 'glibc' 'lib32-glibc' 'cairo'
	 'libcap' 'libcups' 'libdbus' 'expat' 'fontconfig' 'freetype2' 'freetype2' 'gcc-multilib'
	 'gcc-libs-multilib' 'lib32-gcc-libs' 'gdk-pixbuf2' 'libgl' 'glu' 'glib2' 'nspr' 'nss' 'pango'
	 'libx11' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr'
	 'libxrender' 'libxtst' 'zlib'
)

# old deps got by ldd / before switching to doc from
# http://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/
#
#'atk' 'libpng'
#'pcre' 'libffi' 'gconf' 'harfbuzz'
#'pixman' 'bzip2' 'dbus-glib' 'gnutls' 'avahi' 'attr' 'graphite' 'p11-kit' 'libtasn1'
#'nettle' 'gmp'


makedepends=('tar')

optdepends=('ffmpeg: WebGL'
	    'nodejs: WebGL'
	    'jre6: WebGl'
	    'gzip: WebGL'
	    'java-environment-openjdk=7: Android / Tizen'
	    'mono>=4.0.1: MonoDevelop'
	    'mono-addins>=0.6.2: MonoDevelop'
	    'gnome-sharp: MonoDevelop'
	    'desktop-file-utils: MonoDevelop'
	    'hicolor-icon-theme: MonoDevelop'
	    'xsp: To run ASP.NET pages directly from monodevelop'
	    )
source=("http://download.unity3d.com/download_unity/${pkgname}-installer-${pkgver}.sh"
	"eula")
#source=("https://developer.android.com/training/index.html")
md5sums=('dbe1ddc9ebc999b6b538829a90df99a8'
	 '715ba338bad7d12b31bb3642dadd92d4')
options=('!strip')

build() {
  ARCHIVE=$(awk '/^__ARCHIVE_BEGINS_HERE__/ {print NR + 1; exit 0; }' $pkgname-installer-$pkgver.sh)
  echo $ARCHIVE
  tail -n+$ARCHIVE $pkgname-installer-$pkgver.sh | tar xj
}

package() {
 install -D -m644 eula "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
 mv $srcdir/$pkgname-$_pkgver/Editor/chrome-sandbox $srcdir/
 install -d $pkgdir/usr/share/applications
 mv $srcdir/$pkgname-$_pkgver/*.desktop $pkgdir/usr/share/applications/
 install -d $pkgdir/usr/share/icons
 mv $srcdir/$pkgname-$_pkgver/*.png $pkgdir/usr/share/icons/
 install -d /$pkgdir/opt/Unity
 mv $srcdir/$pkgname-$_pkgver/* $pkgdir/opt/Unity
 install -oroot -m4755 $srcdir/chrome-sandbox $pkgdir/opt/Unity/Editor/
}

# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Simon Wilper <sxw@chronowerks.de>

pkgname=libreoffice-slim-fixed-git
_gitname=core
pkgver=7.2.0.r2009af1c0
pkgrel=1
pkgdesc="A slimmed down git version of LibreOffice with launchers & fixed"
arch=('x86_64')
url="https://www.libreoffice.org/community/developers/"
license=('GPL')
makedepends=('curl>=7.20.0' 'hunspell>=1.2.8' 'python>=3.7' 'libwpd>=0.9.2' 'libwps'
	'neon>=0.28.6' 'pango' 'nspr' 'libjpeg' 'libxrandr' 'libgl' 'dbus-glib'
	'libxslt' 'redland' 'hyphen' 'lpsolve' 'gcc-libs' 'sh' 'graphite' 'icu' 
	'lcms2' 'poppler>=0.24.0' 'libvisio' 'libetonyek' 'libodfgen' 'libcdr'
	'libmspub' 'harfbuzz-icu' 'nss' 'hicolor-icon-theme'
	'desktop-file-utils' 'shared-mime-info' 'gst-plugins-base-libs'
	'sane' 'perl-archive-zip' 'zip' 'unzip' 'unixodbc'
	'gperf' 'gtk3' 'qt5-base' 'plasma-framework' 'cppunit' 'clucene'
	'libmythes' 'libwpg' 'postgresql-libs' 'mariadb-libs' 
	'libgl' 'bluez-libs' 'gdb' 'doxygen'  'libatomic_ops'  'mdds' 'glm'
	'apr' 'serf' 'ttf-liberation' 'ttf-dejavu' 'ttf-carlito' 'libxinerama' 'libpagemaker'
	'libabw' 'libmwaw' 'libe-book' 'coin-or-mp' 'liblangtag' 'liborcus' 
	'libexttextcat' 'libcmis' 'gobject-introspection'
	'libtommath' 'libzmf' 'gpgme' 'xmlsec' 'rxvt-unicode' 
	'libepubgen' 'libfreehand' 'libqxp' 'libstaroffice'  'boost' 'libnumbertext'
	'libffi' 'box2d' 'git')
depends=(python)
source=('git+https://gerrit.libreoffice.org/core.git'
        'git+https://github.com/chaotic-aur/pkgbuild-libreoffice-slim-git.git')
md5sums=('SKIP'
        'SKIP')
        
pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "7.2.0.r%s" "$(git log --pretty=%h | head -n1)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  [[ -d workdir ]] && make clean

  build_hash=$(git log --pretty=%h | head -n1)
  build_date=$(date +%Y%m%d)
  ./autogen.sh\
	--enable-dbus\
	--enable-gtk3-kde5\
	--enable-kf5\
	--enable-openssl\
	--enable-qt5\
	--disable-avahi\
    --disable-coinmp\
    --disable-crashdump\
    --disable-cups\
    --disable-dconf\
    --disable-dependency-tracking\
    --disable-firebird-sdbc\
    --disable-gio\
    --disable-gstreamer-1-0\
    --disable-ldap\
    --disable-lotuswordpro\
    --disable-lpsolve\
    --disable-mariadb-sdbc\
    --disable-neon\
    --disable-odk\
    --disable-opencl\
    --disable-postgresql-sdbc\
    --disable-report-builder\
    --enable-lto\
    --enable-pdfimport\
    --enable-optimized=yes\
    --enable-python=system\
    --enable-release-build\
    --with-extra-buildid="${build_hash}-${build_date}"\
    --with-galleries=no\
    --with-java=no\
    --with-package-format=archive\
    --with-vendor="Chaotic-AUR"\
    --without-fonts\
    --without-help
}

build() {
  cd "${srcdir}/${_gitname}"
  make build-nocheck
  cd workdir/installation/LibreOffice/archive/install/en-US
  tar xf *.tar.gz

  cd LibreOffice*/program
  sed -i -e 's@^UserInstallation.*@UserInstallation=$SYSUSERCONFIG/libreoffice@g' bootstraprc
}

package() {
  install -d -m755 ${pkgdir}/opt/libreoffice
  cp -r ${srcdir}/${_gitname}/workdir/installation/LibreOffice/archive/install/en-US/LibreOffice*/* ${pkgdir}/opt/libreoffice

  install -d -m755 ${pkgdir}/usr/share/applications
  cp ${srcdir}/pkgbuild-libreoffice-slim-git/* ${pkgdir}/usr/share/applications
}

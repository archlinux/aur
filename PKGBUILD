pkgname=psi-plus-full
pkgver=1.3.393
pkgrel=1
pkgdesc="Psi+ is a powerful XMPP client. Built with all plugins, translations, skins and extras"
url="https://psi-plus.com"
license=('GPL2')
arch=('x86_64')
depends=('minizip' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'qca-qt5' 'libidn' 'libxss' 'qt5-svg' 'hunspell' 'qtkeychain' 'qt5-webengine')
makedepends=('git' 'patch' 'cmake' 'libotr' 'tidy' 'qt5-tools' 'git' 'libsignal-protocol-c')
optdepends=('libotr: for OTR plugin'
            'tidy: for OTR plugin')
provides=(
    "psi-plus=$pkgver"
)
conflicts=(
    'psi-plus'
    'psi-plus-git'
    'psi-plus-qt5-git'
    'psi-plus-webkit-qt5-git'
    'psi-plus-webkit-git'
    'psi-plus-git'
    'psi-plus-plugins'
    'psi-plus-plugins-git'
    "psi-plus-l10n"
    "psi-plus-l10n-qt5"
    "psi-plus-l10n-git"
    "psi-plus-resources"
    "psi-plus-resources-qt5"
    "psi-plus-resources-qt5-git"
    "psi-plus-resources-git"
    "psi-plus-nowebkit-git"
)

source=(
    "psi::git://github.com/psi-im/psi.git"
    "psi-plus::git://github.com/psi-plus/main.git"
    "plugins::git://github.com/psi-plus/plugins.git"
    "iris::git://github.com/psi-im/iris.git"
    "libpsi::git://github.com/psi-im/libpsi.git"
    "psi-plus-l10n::git://github.com/psi-plus/psi-plus-l10n.git"
    "psi-plus-resources::git://github.com/psi-plus/resources.git"
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cat "${srcdir}/psi/version" | cut -d ' ' -f 1
}

prepare() {
  cd psi

  # cleanup
  git checkout .
  git clean -fd .

  # submodules
  git submodule init
  git config submodule.iris.url "$srcdir/iris"
  git config submodule.src/libpsi.url "$srcdir/libpsi"
  git submodule update

  # cleanup of submodules
  pushd src/libpsi
  git checkout -- .
  git clean -fd .
  popd
  pushd iris
  git checkout -- .
  git clean -fd .
  popd
 
  # copy plugins
  cp -r ../plugins/* src/plugins/

  # apply patches from Psi+ project
  for patch in "$srcdir"/psi-plus/patches/*.diff; do
      echo "* Applying ${patch##*/}"
      patch -p1 -i "$patch"
  done

  # copy additional icon themes
  cp -a "$srcdir"/psi-plus/iconsets .
  
  # set version
  cd $srcdir/psi-plus/admin 
  sh psi-plus-nightly-version $srcdir/psi  > $srcdir/psi/version 
}

build() {
    # Build psi-plus
    pushd "${srcdir}/psi"
    mkdir -p build
    cd build
    echo "* Building psi-plus with plugins - webengine version"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_WEBKIT=ON \
        -DENABLE_PLUGINS=ON \
        -DIS_PSISPLUS=ON \
        ..
    make  
    popd

    echo "* Building translation files"
    pushd "${srcdir}/psi-plus-l10n/translations"
    for langfile in *.ts; do
       lrelease-qt5 "${langfile}"
    done
    popd
}

package() {
    pushd psi
    install -v -dm755 "$pkgdir/usr/share/psi-plus/"
    popd
    pushd psi-plus-resources
    install -v -dm755 "$pkgdir/usr/share/psi-plus/"
    cp -rv * "$pkgdir/usr/share/psi-plus/"
    popd
    # Install translations
    pushd psi-plus-l10n/translations
    install -v -dm755 "$pkgdir/usr/share/psi-plus/translations"
    install -v -m644 *.qm "$pkgdir/usr/share/psi-plus/translations"
    popd
    # Install program  
    pushd psi/build
    make DESTDIR="$pkgdir" install
    popd
}

#EOF

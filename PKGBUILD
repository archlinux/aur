# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=apm-community
pkgver=2.6.1
pkgrel=1
_atomic=atomic.1.0
pkgdesc='Atom package manager'
arch=('x86_64')
url='https://github.com/atom/apm'
license=('MIT')
depends=('libsecret' 'nodejs>=10' 'npm' 'python')
makedepends=('git')
provides=('nodejs-atom-package-manager')
conflicts=('nodejs-atom-package-manager')
replaces=('nodejs-atom-package-manager')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/atom-community/apm/archive/${pkgver}-${_atomic}.tar.gz"
        'apm.js'
        'no-scripts.patch'
        'use-system-npm.patch'
        'git-utils.patch')
sha512sums=('edaffed317b83dfdd99a3de4d483d67f667bd82c9f478760e2960fbbed2e56cc08fbf8e494fb2e933f80cb98adc13954ac30d52d46a3606ae2211f0d830fe52e'
            'c02c18e00c378fc968cd593bfed3ff0636a2786fa9ef212547efc30c54576f55dc94ac503b827ec79283c5deb87a22a7046565d8c630d55ed20d0ad020f8a77f'
            'a962ecc1557bcfe92c8d771a44c3bbbd72d0bf9c81285662ef26a1f99f3604efcca0307e7edb59eb99c2cbc83db4ab844f0db0532ca990581eff28e50c42acd6'
            'de912b3da4f0433be1d960e849dbaf664b6b0d9366b9b8fb784e79f4d5ea35a24cc76c11c9f662b615a66b14ac92c1009d6b85e2c02395d87e27b15daaaa59b8'
            'bf9f4023bfbdc7240e5ed8a87bc9097eb7a57b2bae44f1044098eb380b15ff8a12f92347b99b6754c6adb537b8310d1f47bdfd3e60db411e4d69d575ce70b2a6')

_apmdir='/usr/lib/node_modules/atom-package-manager'

prepare() {
  rm -rf "${srcdir}"/apm-build

  cd apm-${pkgver}-${_atomic}

  # Use custom launcher
  rm bin/apm{,.cmd} bin/npm{,.cmd}
  rm src/cli.coffee
  install -m755 "${srcdir}"/apm.js bin/apm

  # Use system npm
  patch -Np1 -i "${srcdir}"/use-system-npm.patch

  # Don't download binary Node
  patch -Np1 -i "${srcdir}"/no-scripts.patch
  rm BUNDLED_NODE_VERSION script/*
}

build() {
  cd apm-${pkgver}-${_atomic}

  npm install
  npx coffee --compile --output lib src
  npm uninstall coffee-script coffeelint express jasmine-focused shx node-gyp

  cd node_modules/git-utils
  patch -Np1 -i "${srcdir}/git-utils.patch"
  node-gyp rebuild
  cd ../..

  npm pack
}

package() {
  cd apm-${pkgver}-${_atomic}

  install -d -m755 "${pkgdir}${_apmdir}"
  tar -xf atom-ide-community-atom-package-manager-${pkgver}-${_atomic}.tgz  --strip-components 1 \
      -C "${pkgdir}${_apmdir}"
  cp -r node_modules "${pkgdir}${_apmdir}"

  install -d -m755 "${pkgdir}/usr/bin"
  ln -s \
      "$(realpath --relative-to="${pkgdir}/usr/bin" "${pkgdir}${_apmdir}/bin/apm")" \
      "${pkgdir}/usr/bin"

  # Install license file
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}${_apmdir}/LICENSE.md")" \
      "${pkgdir}/usr/share/licenses/${pkgname}"

  # Remove occurrences of ${srcdir}
  find "${pkgdir}" -name "package.json" \
       -exec sed -e "s|${srcdir}/apm-${pkgver}|${_apmdir}|" \
                 -i '{}' \;

  # Remove useless stuff
  find "${pkgdir}"/usr/lib \
      -name ".*" -prune -exec rm -r '{}' \; \
      -or -name "*.a" -exec rm '{}' \; \
      -or -name "*.bat" -exec rm '{}' \; \
      -or -name "*.mk" -exec rm '{}' \; \
      -or -path "*/git-utils/binding.gyp" -exec rm '{}' \; \
      -or -path "*/git-utils/src/*.cc" -exec rm '{}' \; \
      -or -path "*/git-utils/src/*.h" -exec rm '{}' \; \
      -or -path "*/keytar/binding.gyp" -exec rm '{}' \; \
      -or -path "*/keytar/src" -prune -exec rm -r '{}' \; \
      -or -path "*/oniguruma/binding.gyp" -exec rm '{}' \; \
      -or -path "*/oniguruma/src" -prune -exec rm -r '{}' \; \
      -or -name "appveyor.yml" -exec rm '{}' \; \
      -or -name "benchmark" -prune -exec rm -r '{}' \; \
      -or -name "binding.Makefile" -exec rm '{}' \; \
      -or -name "config.gypi" -exec rm '{}' \; \
      -or -name "deps" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "html" -prune -exec rm -r '{}' \; \
      -or -name "Makefile" -exec rm '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -name "obj.target" -prune -exec rm -r '{}' \; \
      -or -name "samples" -prune -exec rm -r '{}' \; \
      -or -name "scripts" -prune -exec rm -r '{}' \; \
      -or -name "test" -prune -exec rm -r '{}' \; \
      -or -name "tests" -prune -exec rm -r '{}' \;
}

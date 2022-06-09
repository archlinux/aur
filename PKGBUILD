# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=apm
pkgver=2.6.5
_sha=ade8fbe124b18f5949a6b20b8e02a551d5405d67
pkgrel=4
pkgdesc='Atom package manager'
arch=(x86_64)
url="https://github.com/atom/$pkgname"
license=(MIT)
_electron=electron14 # must match atom package
depends=(# libgit2{,.so} # see https://bugs.archlinux.org/task/74164
         libsecret
         nodejs)
makedepends=(git
             npm)
provides=(nodejs-atom-package-manager)
conflicts=(nodejs-atom-package-manager)
replaces=(nodejs-atom-package-manager)
options=(!emptydirs)
_archive="$pkgname-$_sha"
source=("$url/archive/$_sha/$_archive.tar.gz"
        apm.js
        no-scripts.patch)
        # git-utils.patch)
sha512sums=('3788ccc2f6b2fe63792463c282ebb1710aaf2dccb595c3177494cd8800fc5e5df3f3b49481f6342fcff770882c50c2d171d9d53a985184e84b875f386c5a2039'
            'dd6786d44278f1edbfb87d4a4a639da4fd4b8ab9aca85ae430e113256befd3850b1fb375353afb5f1f4b99ad3dc2666b37d6d6c31c7563d992d8c034d0d2750a'
            'a962ecc1557bcfe92c8d771a44c3bbbd72d0bf9c81285662ef26a1f99f3604efcca0307e7edb59eb99c2cbc83db4ab844f0db0532ca990581eff28e50c42acd6')

_apmdir='/usr/lib/node_modules/atom-package-manager'

prepare() {
  ! test -d "$srcdir"/apm-build
  cd "$_archive"

  # Use custom launcher
  rm bin/apm{,.cmd} bin/npm{,.cmd}
  rm src/cli.coffee
  install -m0755 "$srcdir/apm.js" bin/apm
  sed -i -e "s/@ELECTRON@/$_electron/" bin/apm

  # Don't download binary Node
  patch -Np1 -i "$srcdir/no-scripts.patch"
  rm BUNDLED_NODE_VERSION script/*

  sed -i -e '/git-utils/s/5.7.2/5.7.3/' package.json

  npm install --cache "$srcdir/npm-cache"
  # pushd node_modules/git-utils
  # patch -Np1 -i "$srcdir/git-utils.patch"
}

build() {
  cd "$_archive"

  npx coffee --compile --output lib src
  npm uninstall coffee-script coffeelint express jasmine-focused shx node-gyp

  # pushd node_modules/git-utils
  # node-gyp rebuild
  # popd

  npm pack
}

package() {
  cd "$_archive"
  install -d -m755 "$pkgdir$_apmdir"
  tar -xf atom-package-manager-*.tgz --strip-components 1 \
      -C "$pkgdir$_apmdir"
  cp -r node_modules "$pkgdir$_apmdir"

  install -d -m755 "$pkgdir/usr/bin"
  ln -s \
      "$(realpath --relative-to="$pkgdir/usr/bin" "$pkgdir$_apmdir/bin/apm")" \
      "$pkgdir/usr/bin"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md

  # Remove occurrences of ${srcdir}
  find "$pkgdir" -name "package.json" \
       -exec sed -e "s|$srcdir/$_archive|$_apmdir|" \
                 -i '{}' \;

  # Remove useless stuff
  find "$pkgdir"/usr/lib \
      -name '.*' -prune -exec rm -r '{}' \; \
      -or -name '*.a' -exec rm '{}' \; \
      -or -name '*.bat' -exec rm '{}' \; \
      -or -name '*.mk' -exec rm '{}' \; \
      -or -path '*/git-utils/binding.gyp' -exec rm '{}' \; \
      -or -path '*/git-utils/src/*.cc' -exec rm '{}' \; \
      -or -path '*/git-utils/src/*.h' -exec rm '{}' \; \
      -or -path '*/keytar/binding.gyp' -exec rm '{}' \; \
      -or -path '*/keytar/src' -prune -exec rm -r '{}' \; \
      -or -path '*/oniguruma/binding.gyp' -exec rm '{}' \; \
      -or -path '*/oniguruma/src' -prune -exec rm -r '{}' \; \
      -or -name 'appveyor.yml' -exec rm '{}' \; \
      -or -name 'benchmark' -prune -exec rm -r '{}' \; \
      -or -name 'binding.Makefile' -exec rm '{}' \; \
      -or -name 'config.gypi' -exec rm '{}' \; \
      -or -name 'deps' -prune -exec rm -r '{}' \; \
      -or -name 'doc' -prune -exec rm -r '{}' \; \
      -or -name 'html' -prune -exec rm -r '{}' \; \
      -or -name 'Makefile' -exec rm '{}' \; \
      -or -name 'man' -prune -exec rm -r '{}' \; \
      -or -name 'obj.target' -prune -exec rm -r '{}' \; \
      -or -name 'samples' -prune -exec rm -r '{}' \; \
      -or -name 'scripts' -prune -exec rm -r '{}' \; \
      -or -name 'test' -prune -exec rm -r '{}' \; \
      -or -name 'tests' -prune -exec rm -r '{}' \;
}

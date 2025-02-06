# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=humanifyjs
_gitpkgname=humanify
pkgver=2.2.2
pkgrel=1
pkgdesc='Deobfuscate Javascript code using ChatGPT'
arch=('x86_64')
url='https://github.com/jehna/humanify'
license=('MIT')
depends=('bash' 'glibc' 'gcc-libs' 'nodejs')
makedepends=('gcc' 'npm' 'nvm')
optdepends=(
  'cuda: support for local LLMs'
  'vulkan-icd-loader: support for local LLMs'
)
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/jehna/humanify/archive/v${pkgver}.tar.gz"
  'humanify.bash'
)

sha512sums=(
  '23befc5627608503dc03ccbc675439afb9139087ae720fc72b61f660c46d55c328e7a8ffb75a8b21f5dbb1b697d3f24ba3e9a369b3e215761ea70dfd04ec511e'
  'fb93857f6c754e1296280c5dd3f4438813232d3bf6faa96ba480d0e29eb683d7d8abef20fc80508ffb358ad40b37d752128cfd58d9ab686a59d0db51108c46a2'
)

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm

  # Odd-numbered versions of Node.js are not supported at build time.
  # See also:
  # https://github.com/laverdet/isolated-vm/issues/515#issuecomment-2566623414
  echo >&2 'Installing supported Node.js version'
  nvm install --lts
}

build() {
  cd "${_gitpkgname}-${pkgver}"

  _ensure_local_nvm
  npm install --cache "${srcdir}"/npm-cache
  npm run build
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Removing unneeded files and directories'
  find node_modules -type f \
          \( \
         -iname '*Makefile*' -o \
         -iname '*appveyor.yml' -o \
         -iname '*.babelrc' -o \
         -iname '*.bak' -o \
         -iname '*bower.json' -o \
         -iname '*.c' -o \
         -iname '*.cc' -o \
         -iname '*.cpp' -o \
         -iname '*.md' -o \
         -iname '*.markdown' -o \
         -iname '*.rst' -o \
         -iname '*.nycrc' -o \
         -iname '*.npmignore' -o \
         -iname '*.editorconfig' -o \
         -iname '*.el' -o \
         -iname '*.eslintignore' -o \
         -iname '*.eslintrc*' -o \
         -iname '*.fimbullinter.yaml' -o \
         -iname '*.gitattributes' -o \
         -iname '*.gitmodules' -o \
         -iname '*.h' -o \
         -iname '*.html' -o \
         -iname '*.jshintrc' -o \
         -iname '*.jscs.json' -o \
         -iname '*.log' -o \
         -iname '*logo.svg' -o \
         -iname '*.nvmrc' -o \
         -iname '*.o' -o \
         -iname '*package-lock.json' -o \
         -iname '*.travis.yml' -o \
         -iname '*.prettierrc' -o \
         -iname '*.sh' -o \
         -iname '*.tags*' -o \
         -iname '*.tm_properties' -o \
         -iname '*.wotanrc.yaml' -o \
         -iname '*tsconfig.json' -o \
         -iname '*yarn.lock' -o \
         -iname '*-musl.node' \
         \) \
         -delete
  find node_modules -type d \
          \( \
         -iwholename '*.github' -o \
         -iwholename '*.tscache' -o \
         -iwholename '*/man' -o \
         -iwholename '*/test' -o \
         -iwholename '*/scripts' -o \
         -iwholename '*/git-hooks' -o \
         -iwholename '*/linux-arm64' \
         \) \
         -exec rm -rf {} +
  find node_modules -type d -empty -delete

  echo >&2 'Packaging vendored modules, lib and entry point'
  install -vdm 755 "$pkgdir/usr/lib/node_modules/$pkgname/"
  cp -a {dist,node_modules,package.json} "$pkgdir/usr/lib/node_modules/$pkgname/"

  echo >&2 'Packaging the executable'
  install -D -m 755 -T "${srcdir}/humanify.bash" \
    "${pkgdir}/usr/bin/humanify"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}

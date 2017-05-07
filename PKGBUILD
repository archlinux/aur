# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:
#
# PKGBUILD reference: https://wiki.archlinux.org/index.php/PKGBUILD

pkgname=bash-it-git
pkgver=master
pkgrel=1
pkgdesc='A community Bash framework'
arch=('any')
url='https://github.com/Bash-it/bash-it'
license=('custom:undecided')
depends=('bash' 'coreutils' 'curl' 'p7zip')
optdepends=(
  'autojump: plugin'
  'base-devel: `makefile` completion'
  'docker: plugin'
  'git: theme integration, multiple alias/completion/plugin modules'
  'hub: completion, plugin'
  'irssi: integration'
  'java-environment-common: plugin'
  'python: plugin'
  'python3: plugin, `django` completion, `proxy` plugin'
  'packer: completion'
  'ruby: theme integration, plugin'
  'ruby-bundler: alias, completion'
  'rbenv: plugin'
  'thefuck: aliases'
  'wget: `browser` plugin'
)
conflicts=('bash-it')
options=('libtool' 'staticlibs' '!strip')
install="${pkgname}.install"
source=(
  'https://github.com/Bash-it/bash-it/tarball/master'
  'LICENSE'
  'custom.lib.bash.shim'
  'install.sh.wrapper'
)
sha512sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
noextract=("${pkgname}.tar.gz")

prepare() {
  mv "${srcdir}/master"{,.tar.gz}

  tar -x \
    -f "${srcdir}/master.tar.gz" -z \
    --no-anchored --wildcards -C "${srcdir}" \
    --exclude='test' \
    --strip-components=1 \
    '.editorconfig' 'aliases' 'completion' 'custom' \
    'lib' 'plugins' 'template' 'themes' \
    'CONTRIBUTING.md' 'README.md' '*.sh'
}

package() {
  # All upstream-provided files go into the /usr hierarchy
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  cp --preserve=mode -t \
    "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/LICENSE"

  cp -r --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    "${srcdir}"/{bash_it,install,uninstall}.sh \
    "${srcdir}"/{aliases,completion,custom,lib} \
    "${srcdir}"/{plugins,themes}

  # Copy warning shim to `lib/custom.bash`
  cp --preserve=mode \
    "${srcdir}/custom.lib.bash.shim" \
    "${pkgdir}/usr/lib/${pkgname}/lib/custom.bash"

  # `.editorconfig` it not meant to be user-editable
  cp -r --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    "${srcdir}/.editorconfig" \
    "${srcdir}/install.sh" \
    "${srcdir}/template"

  # Copy wrapper for `install.sh`
  cp --preserve=mode \
    "${srcdir}/install.sh.wrapper" \
    "${pkgdir}/usr/share/${pkgname}/install.sh"

  cp --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}"/*.md

  # This is where things get a little tricky.
  # 
  # Bash-it requires a particular structure where
  # both user-customizable and upstream-provided scripts
  # share the same directories.
  #
  # This was a deliberate design decision on bash-it's end;
  # however, this design reaches its limits when we use
  # a package manager.
  #
  # We're going to apply a bit of symlink trickery so
  # Bash-it plays nice with makepkg/pacman while
  # staying true to the following goals:
  #
  # 1. Protect custom user files when upgrading
  # 2. Still allow multiple users to have their own
  #    custom scripts under /home
  # 3. Avoid patching upstream files

  # Install user-specific parts into a "home factory",
  # which will serve as a template for ~/.bash_it later on
  _factorydir="${pkgdir}/usr/share/${pkgname}/home_factory/.bash_it"

  # For aliases, completions, and plugins, create symlinks
  # to the respective `available` directories
  for _file_type in aliases completion plugins; do
    mkdir -p "${_factorydir}/${_file_type}"
    ln -fns "/usr/lib/${pkgname}/${_file_type}/available" \
      "${_factorydir}/${_file_type}/"
  done

  # Create replacement for `lib/custom.bash`
  mkdir -p "${_factorydir}/custom/lib"

  # Create symlink to `custom/example.bash`
  ln -fs \
    "/usr/lib/${pkgname}/custom/example.bash" \
    "${_factorydir}/custom/"

  # Create symlinks to remaining files
  ln -fs \
    "/usr/lib/${pkgname}"/{bash_it,install,uninstall}.sh \
    "/usr/lib/${pkgname}"/{lib,themes} \
    "/usr/share/${pkgname}"/{.editorconfig,template} \
    "/usr/share/doc/${pkgname}"/{CONTRIBUTING,README}.md \
    "${_factorydir}/"
}

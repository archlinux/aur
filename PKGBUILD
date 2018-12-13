# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:
#
# PKGBUILD reference: https://wiki.archlinux.org/index.php/PKGBUILD

pkgname=bash-it-git
pkgver=r2382.b973bb1
pkgrel=1
pkgdesc='A community Bash framework'
arch=('any')
url='https://github.com/Bash-it/bash-it'
license=('custom:undecided')
depends=('bash' 'coreutils' 'curl' 'p7zip')
makedepends=('git')
optdepends=(
  'autojump: plugin'
  'base-devel: `makefile` completion'
  'docker: plugin'
  'git: theme integration, multiple alias/completion/plugin modules'
  'hub: completion, plugin'
  'irssi: integration'
  'java-environment-common: plugin'
  'python2: plugin'
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
  "${pkgname}::git+https://github.com/Bash-it/bash-it.git"
  'LICENSE'
  'custom.lib.bash.shim'
  'install.sh.wrapper'
  'upgrade.sh.wrapper'
)
sha512sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
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
    "${srcdir}/${pkgname}"/{bash_it,install,uninstall}.sh \
    "${srcdir}/${pkgname}"/{aliases,completion,custom,lib} \
    "${srcdir}/${pkgname}"/{plugins,scripts,themes}

  # Copy warning shim to `lib/custom.bash`
  cp --preserve=mode \
    "${srcdir}/custom.lib.bash.shim" \
    "${pkgdir}/usr/lib/${pkgname}/lib/custom.bash"

  # `.editorconfig` is not meant to be user-editable
  cp -r --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    "${srcdir}/${pkgname}/.editorconfig" \
    "${srcdir}/${pkgname}/install.sh" \
    "${srcdir}/${pkgname}/template"

  # Copy wrappers for `install.sh` and `upgrade.sh`
  for event in install upgrade; do
    cp --preserve=mode \
      "${srcdir}/${event}.sh.wrapper" \
      "${pkgdir}/usr/share/${pkgname}/${event}.sh"
  done

  cp --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}"/*.md

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
  # to the respective `${_file_type}/available` directories
  # because earlier versions of Bash-it used to place enabled
  # symlinks into `${_file_type}/enabled`, to which the user
  # would have needed write permissions.
  # Newer Bash-it installs will place all symlinks into
  # a common, top-level `enabled` directory, and will no
  # longer use `${_file_type}/enabled` directories.
  # We keep the below symlinks around in order to protect
  # legacy installations, whose users may have non-empty
  # `${_file_type}/enabled` directories.
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
    "/usr/lib/${pkgname}"/{lib,scripts,themes} \
    "/usr/share/${pkgname}"/{.editorconfig,template} \
    "/usr/share/doc/${pkgname}"/{CONTRIBUTING,DEVELOPMENT,README}.md \
    "${_factorydir}/"
}

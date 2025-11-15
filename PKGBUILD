# Maintainer : Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Jochen Keil <jochen.keil@gmail.com>

_name='snapsync'
pkgname="ruby-snapsync"
pkgver=0.5.0
pkgrel=4
pkgdesc='tool to automate backing up snapper snapshots to other medias'
arch=('any')
url="https://github.com/Eximius/${_name}"
license=('MIT')
depends=(btrfs-progs ruby ruby-logging ruby-concurrent ruby-dbus ruby-thor ruby-uri-ssh_git ruby-net-ssh ruby-net-sftp ruby-rexml ruby-libnotify)
makedepends=('git')
checkdepends=('ruby-bundler' 'ruby-minitest' 'ruby-rake' 'ruby-flexmock' 'ruby-fakefs' 'ruby-irb')
options=('!emptydirs')
source=("$_name::git+$url#commit=692ae07c124aa764634bf64d773a8fe95916f97c")
b2sums=('8a8ed9afa1a2cae178ccd20b46a9a1d69336e2955461e6a69ea05e59ec669672322612a0a3d1a007b4c290d9a93493e94492eae28b93a72372006af0f3bc66f0')

prepare() {
  cd "${_name}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"
}

build() {
  cd "${_name}"

  local _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_name}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd "${_name}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd "${_name}"

  cp --archive --verbose tmp_install/* "${pkgdir}"
}

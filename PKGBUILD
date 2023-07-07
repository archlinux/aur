# Maintainer: éclairevoyant
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

_pkgname=fpm
pkgname="$_pkgname-git"
pkgver=1.15.1.r3.b085edc4
_pkgver=${pkgver%%.r*}
pkgrel=1
pkgdesc='Build packages for multiple platforms with great ease and sanity'
arch=(any)
url="https://github.com/jordansissel/$_pkgname"
license=(MIT)
depends=(
	python-simplejson
	python-setuptools
	ruby-cabin
	ruby-backports
	ruby-arr-pm
	ruby-clamp
	ruby-pleaserun
	ruby-stud
	ruby-rexml)
makedepends=(
	git
	ruby-rspec
	ruby-insist
	ruby-pry
	ruby-rake
)
provides=("$_pkgname=$_pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname

	local _gemdir="$(gem env gemdir)"

  gem build "$_pkgname.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$_pkgname-$_pkgver.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$_gemdir/cache/" \
    "tmp_install/$_gemdir/gems/$_pkgname-$_pkgver/vendor/" \
    "tmp_install/$_gemdir/doc/$_pkgname-$_pkgver/ri/ext/"

  find "tmp_install/$_gemdir/gems/" \
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

  find "tmp_install/$_gemdir/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
	cd $_pkgname
	local _gemdir="$(gem env gemdir)"
	GEM_HOME="tmp_install/$_gemdir" rspec
}

package() {
	cd $_pkgname

  cp --archive --verbose tmp_install/* "$pkgdir"

  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -vDm0644 *.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}

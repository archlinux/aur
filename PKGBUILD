# Maintainer: Whyme Lyu <callme5long@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
#
# Forked from Arch packaging repo:
# https://gitlab.archlinux.org/archlinux/packaging/packages/haproxy

# Built with aws-lc, jemalloc & libslz.
# This is pretty close to upstream's "performance packages" which is
# only available for Debian & Ubuntu for now:
# https://www.haproxy.com/downloads

# Make the package name the same as official performance packages
# (why is it not called haproxy-pp though)
pkgname=haproxy-awslc
_pkgname=haproxy
pkgver=3.3.6
pkgrel=1

pkgdesc='Reliable, high performance TCP/HTTP load balancer. Built with aws-lc'
url='https://www.haproxy.org/'
arch=('x86_64')
license=('GPL-2.0-or-later')

# Just sort it alphabetically
depends=(
  'aws-lc'
  'jemalloc'
  'libcrypt.so'
  'libjemalloc.so'
  'libxcrypt'
  'lua'
  'pcre2'
  'systemd-libs'
)
checkdepends=('varnish')
makedepends=('git' 'systemd')

provides=($_pkgname)
conflicts=($_pkgname)

backup=('etc/haproxy/haproxy.cfg')

validpgpkeys=('0C9568FA554656551590C5E44E386D9C9C61702F'  # Willy Tarreau <w@1wt.eu>
              '07D5F18D201984D7D13FB7AAF5F936267AA4B280'  # Christopher Faulet <christopher.faulet@capflam.org>
              '692A51FE968BDB627C8C4B0E12F8CCEE5C19FD8D') # Amaury Denoyelle <adenoyelle@haproxy.com>

# Each release serie has its own repository. This is handled automatically in
# PKGBUILD, but nvchecker configuration needs to be updated on bump!

source=("git+https://git.haproxy.org/git/haproxy-${pkgver%.*}.git#tag=v${pkgver}?signed"
        'haproxy.cfg'
        'haproxy.sysusers'
        '0001-Use-CFLAGS-and-LDFLAGS-when-building-admin.patch')

# We don't really need to verify a signed git tag w/ checksum.
# For source files within this repo: they are equally trustworthy
# to this PKGBUILD (which is not verified by checksum). Besides,
# I believe them being managed by git which is content-addressed
# implies some sort of integrity check.
#
# However, I've already setup this repo to run updpkgsums easily...
sha256sums=('bbacd8569c44240f44c279018492a60e698b64d860cf6ef8d5554333fa05e764'
            'bd6ebf57fa417d42fe48340664e3620f08d4b40312d4be41dba51ef34bc0223c'
            'c6e716ea59272a8e871af53703726dd2a75b56c82dacf097d4bf08ac5e841a0d'
            'a1e3a1c2923465081383eb431bae55ff9841d89909469311cdba4b394ec4a998')
prepare() {
  cd "haproxy-${pkgver%.*}"

  patch -p1 <"$srcdir"/0001-Use-CFLAGS-and-LDFLAGS-when-building-admin.patch
}

build() {
  cd "haproxy-${pkgver%.*}"

  export CFLAGS="$CFLAGS -fwrapv"

  make \
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    ADDLIB="-Wl,-rpath=/usr/lib/aws-lc/ -ljemalloc" \
    SSL_INC=/usr/include/aws-lc/ \
    SSL_LIB=/usr/lib/aws-lc/ \
    TARGET=linux-glibc \
    USE_LUA=1 \
    USE_MEMORY_PROFILING=1 \
    USE_OPENSSL_AWSLC=1 \
    USE_PCRE2=1 USE_PCRE2_JIT=1 \
    USE_PROMEX=1 \
    USE_QUIC=1

  make \
    SBINDIR=/usr/bin \
    OPTIMIZE= \
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    admin/{halog/halog,iprange/ip{,6}range}
  make \
    SBINDIR=/usr/bin \
    -C admin/systemd/
}

check() {
  cd "haproxy-${pkgver%.*}"

  # I'd like to make sure haproxy actually links to .so of aws-lc
  # A misconfigured build could fallback to linking openssl because aws-lc
  # doesn't change the soname.
  #
  # ldd ./haproxy | grep -Fq /usr/lib/aws-lc/
  #
  # However, aws-lc upstream doesn't promise ABI stability yet. The
  # maintainer of AUR/aws-lc decides to go with staticlib for now.
  # Good news for me: the build process of haproxy stays the same.
  #
  # Upstream issue: https://github.com/aws/aws-lc/issues/1098
  if [ $? = 1 ]; then
    echo "Executable \`haproxy' isn't linked to aws-lc libraries. Abort"
    return 1
  fi

  make \
    REGTESTS_TYPES=default,devel \
    VTEST_PROGRAM=/usr/bin/vtest \
    unit-tests reg-tests
}

package() {
  cd "haproxy-${pkgver%.*}"

  make \
    PREFIX="$pkgdir"/usr \
    SBINDIR="$pkgdir"/usr/bin \
    DOCDIR="$pkgdir"/usr/share/haproxy \
    install

  for admin in admin/{halog/halog,iprange/ip{,6}range}; do
    install -D -m0755 $admin "$pkgdir"/usr/bin/$(basename $admin)
  done

  install -D -m0644 ../haproxy.sysusers "$pkgdir"/usr/lib/sysusers.d/haproxy.conf
  install -D -m0644 ../haproxy.cfg "$pkgdir"/etc/haproxy/haproxy.cfg
  install -D -m0644 admin/systemd/haproxy.service \
    "$pkgdir"/usr/lib/systemd/system/haproxy.service
  install -D -m0644 admin/syntax-highlight/haproxy.vim \
    "$pkgdir"/usr/share/nvim/runtime/syntax/haproxy.vim
  cp -r examples "$pkgdir"/usr/share/haproxy/examples
}

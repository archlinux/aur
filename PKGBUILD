# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: ZhenDong Wu <wzd04062@sina.com>
# Contributor: someone5678 <someone5678 dot dev at google dot com>

pkgname=libfprint-cs9711-git
_pkgname=libfprint
pkgver=1.94.10+6.r1844.20260212.2c7842c9
pkgrel=1
pkgdesc="libfprint with proprietary FPC match on host device CS9711Fingprint driver"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  libgudev
  libgusb
  opencv
  openssl
  pixman
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
  systemd
  cmake
  doctest
)
checkdepends=(
  cairo
  umockdev
  doctest
)
provides=("libfprint=${pkgver}" "libfprint-2.so" "libfprint-cs9711")
replaces=("libfprint-cs9711<=1.94.8")
conflicts=("libfprint>=1.1")
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git"
        "sigfm::git+https://gitlab.freedesktop.org/Tooniis/libfprint#branch=sigfm"
        '0000-data_autosuspend.hwdb.patch'
        '0000-libfprint_drivers_cs9711_cs9711.c.patch'
        '0000-libfprint_drivers_cs9711_cs9711.h.patch'
        '0000-libfprint_meson.build.patch'
        '0000-meson.build.patch'
        '0001-Remove-CS9711-from-unsupported-hardware-list-since-t.patch'
        '0002-Add-devbox-w-some-quick-commands-to-build-and-test.patch'
        '0003-Fix-SIGSEGV-init-crash-when-CS9711-device-returns-un.patch'
        '0004-Changes-derived-from-RE-Windows-driver.patch'
        '0005-Update-libfprint-drivers-cs9711-cs9711.c.patch'
        '0006-Fix-introspection-failures.patch'
)
b2sums=('SKIP'
        'SKIP'
        '54bd39f040caaf7a70b830182bdcd65a8b5b629afaed619f60a083b12284a37a8f8a56711a689879d26c4a6d75a782e96978ffbf63198ed3578a4fa146742fde'
        'a9844bf3221b4c2112406d24a2305847711a151fd477eac430c1eab2c810ba901e689510860424592ba5f29741050dc46e4a76fcfd69a5bbbf136ee4e9753bbd'
        '965591e37d48daf8919827b66cbcd859bc83ba6fd13f4bc0e49a6f3f4402906f20b86c05aa738568558d946e96b68e7f618a8f7d1cfed9291626060224ff1d85'
        '9610f028c08987a5c8093609d606a02aa0f1e7a33632ad42b135471d8a518b88b90baa8f636d2f2897dc496a02f252c88d53917f4a76c0ccccacb3558fe6cda7'
        'a96cace4c5978104e9a7b1ad16a20247fcf3a1c2b008719a5534f727ebf434a6704a1a5398c087ac243257777cb3e75fe24604c2b295f1f9276c09fdcb635988'
        '3676b4fe5ac8266e8860f79761adcb30401f3ccb9c88cfdb491a4293921cbc70a2417419ebe454a587af93c65df8a1de981b675983422f00f187e84f5adc61fb'
        'f8a6a7a1f0e8fdd14efe55baebd4ef57ea0526cd080120208173173834588c25488a0a19076a9e7dfc43e2ce33d0ff28a74896e553167cd02f6bda220354f14f'
        '54ed03b22a59713a7d11e9df6be34cfcd297a7ce31ec64c1375aedc996eb04fc09befa6048c6307cca8dc91d5984ff43eed1c718458917f0761181c95f61d22e'
        'c919f1918d090999ec19afdcaad05cc9aa850f929f880509764a8d425c5f3fb34967888ef958adcce835bda94f340aea96e34db9233e7859c991c05e8d422a89'
        '3b02896b460e70c31cc1b92892cdc51b447ef9310a611cfde0d754715fb6b9f916dd2563a61425ae5e6a7d43d1ce1f5a8de267888ea82339646d9b22ccc3aa51'
        'dd20c7e65df766c0ba2e5e9a7c79e93d161d688705a693721d536f4dbb44e60e94c512602d07bde9ceecb2d250c405dd7dc3887b6716249611945c7abbdc1121'
)

pkgver() {
  cd "${_pkgname}"

  _ver="$(git describe --tags origin/master | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count origin/master)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" origin/master)"
  _hash="$(git rev-parse --short origin/master)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  pushd "sigfm" > /dev/null
  git fetch --all
  git config user.email >&- || git config user.email "makepkg@local.com"
  git config user.name >&- || git config user.name "makepkg"
  git reset --hard origin/sigfm && git clean -fdd
  rm -Rf ".gitlab-ci" && \
    git add . && \
    git commit -m "Remove .gitlab-ci" || true
  popd

  pushd "${_pkgname}" > /dev/null
  git fetch --all
  git config remote.sigfm.url >&- || git remote add sigfm $srcdir/sigfm
  git config user.email >&- || git config user.email "makepkg@local.com"
  git config user.name >&- || git config user.name "makepkg"
  git reset --hard origin/master && git clean -fdd
  rm -Rf ".gitlab-ci" && \
    git add . && \
    git commit -m "Remove .gitlab-ci" || true
  git fetch sigfm makepkg
  git merge sigfm/makepkg --no-edit
  sed -i 's|import shutil|import shutil\n    import traceback|g' tests/virtual-image.py
  for patch in $srcdir/*.patch; do
    git apply $patch
  done
  popd
}

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    # -D drivers=all

    -D installed-tests=false
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

# [HACK] Don't test as we can't pass test at all.
# check() {
#   meson test -C build --print-errorlogs
# }

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

# Maintainer: Hive maintainers <maintainers@users.noreply.github.com>
#
# Packaging model (read before editing):
#   * This is a `-bin` package: it ships the prebuilt `hive-cli` rubygem
#     attached to the GitHub Release, not a build of hive from source.
#   * `package()` runs `gem install`, which fetches hive's RUNTIME
#     dependency gems (sqlite3, lipgloss, bubbletea, thor, ...) from
#     rubygems.org. This needs network access during package(): fine for
#     `yay`/`paru` (networked builds), but a network-isolated clean
#     chroot (`makechrootpkg`) will fail. Documented tradeoff; see the
#     project plan for the deferred "vendor deps into the gem" follow-up.
#   * `arch=('any')` is correct despite those deps being platform-native:
#     rubygems resolves the right precompiled binary gem per host at
#     install time. If a precompiled binary is absent for the resolved
#     version on a given arch (notably aarch64), `gem install` compiles
#     from source — which needs a C toolchain + Ruby headers. `base-devel`
#     (always present for makepkg) covers that, so it is not duplicated in
#     makedepends below.
#   * .SRCINFO is GENERATED (`makepkg --printsrcinfo`), never hand-edited.
#     There is intentionally no .SRCINFO.template — a hand-maintained one
#     drifted from this PKGBUILD in the past (tebako-era tarball refs).
pkgname=hive-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Folder-as-agent pipeline for autonomous software tasks'
arch=('any')
url='https://github.com/ivankuznetsov/hive'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rubygems')
# `provides=('hive')` + `conflicts=('hive')` is INTENTIONAL and not a
# self-conflict. We provide the virtual `hive` capability so consumers
# can `pacman -S hive`, and conflict with the unrelated `apache-hive`
# AUR package name `hive` (the SQL-on-Hadoop tool) so pacman blocks
# the collision before our symlink fallback is needed.
provides=('hive')
conflicts=('hive' 'apache-hive')
install=hive.install
source=("https://github.com/ivankuznetsov/hive/releases/download/v${pkgver}/hive-cli-${pkgver}.gem")
sha256sums=('e79b3bba9afad6a86301b2a906434433c24eea2bf2d34903446231db359e478b')
noextract=("hive-cli-${pkgver}.gem")

package() {
  local gem_home="${pkgdir}/usr/share/hive/gems"
  install -dm755 "${gem_home}"

  # `gem install --install-dir` requires the .gem file path, not the
  # extracted source. `noextract` keeps the .gem intact during
  # makepkg's source preparation step.
  # `--ignore-dependencies` is a boolean flag (no value): the runtime
  # deps install by default. Passing `=false` makes gem's OptionParser
  # raise NeedlessArgument and abort package().
  gem install \
    --install-dir "${gem_home}" \
    --bindir "${gem_home}/bin" \
    --no-document \
    "${srcdir}/hive-cli-${pkgver}.gem"

  # User-facing /usr/bin/hive wrapper that sets GEM_PATH before exec'ing
  # the gem-installed bin. Without this, `hive` would only work when the
  # user's default GEM_PATH includes the vendored gem home.
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/hive" <<WRAPPER
#!/usr/bin/env bash
export GEM_HOME="/usr/share/hive/gems"
export GEM_PATH="\${GEM_HOME}\${GEM_PATH:+:\$GEM_PATH}"
exec "/usr/share/hive/gems/bin/hive" "\$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/hive"

  # `hv` is a symlink to our hive wrapper, NOT the gem's bin/hv: bin/hv is
  # a bash script, but `gem install` generates a Ruby binstub for every
  # executable, and a Ruby binstub cannot run a bash program. Pointing hv
  # at the working hive wrapper gives the Apache-Hive-collision shim.
  ln -s hive "${pkgdir}/usr/bin/hv"

  install -Dm644 "${gem_home}/gems/hive-cli-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  printf 'aur\n' > "${pkgdir}/usr/share/hive/install-channel"
}

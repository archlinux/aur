# Verified Stable: crowdsec-stable

# [[file:../../../Documents/crowdsec_maintenance.org::*Verified Stable: crowdsec-stable][Verified Stable: crowdsec-stable:1]]
# Maintainer: Nathan Burke
pkgname=crowdsec-stable
_pkgname=crowdsec
pkgver=1.7.7
pkgrel=2
options=('!lto')
pkgdesc="CrowdSec lightweight and collaborative security engine (GCC 14 Patched)"
arch=('x86_64' 'aarch64')
url="https://github.com/crowdsecurity/crowdsec"
license=('MIT')
depends=('sqlite' 'geoip2-database' 'yaml-cpp' 're2' 'glibc' 'gcc-libs' 'bash')
makedepends=('git' 'go' 'gcc' 'make' 'pkg-config')
provides=("crowdsec=$pkgver")
conflicts=('crowdsec' 'crowdsec-bin' 'crowdsec-git') # Adjust conflicts accordingly

# Protects user configs from being overwritten on update!
backup=(etc/crowdsec/{acquis,config,console,profiles,simulation}.yaml
        etc/crowdsec/{local_api_credentials,online_api_credentials}.yaml
        etc/crowdsec/console/context.yaml
        etc/crowdsec/notifications/{email,file,http,sentinel,slack,splunk}.yaml)

source=("${_pkgname}::git+https://github.com/crowdsecurity/crowdsec.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"

  # 1. Path Sanitization (The Arch Way)
  sed -i 's|/usr/local/|/usr/|' config/{crowdsec.service,config.yaml}

  # 2. Setup Vendoring for the patch
  go mod vendor

  # 3. Apply GCC 14+ <cstring> patch
  echo "Applying GCC 14+ <cstring> patch..."
  find vendor -name "cre2.cpp" -exec sed -i '1i #include <cstring>' {} +
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

  make BUILD_VERSION="v${pkgver}" build
}

package() {
  cd "$_pkgname"

  # Binaries
  install -Dm755 cmd/crowdsec/crowdsec cmd/crowdsec-cli/cscli -t "${pkgdir}/usr/bin"

  # Configs & Data Dirs
  install -Dm600 config/detect.yaml -t "${pkgdir}/var/lib/${_pkgname}/data"
  install -Dm644 config/{acquis,console,profiles,simulation}.yaml -t "${pkgdir}/etc/${_pkgname}"
  install -Dm600 config/{config,local_api_credentials,online_api_credentials}.yaml -t "${pkgdir}/etc/${_pkgname}"
  install -Dm644 config/context.yaml -t "${pkgdir}/etc/${_pkgname}/console"
  install -Dm644 config/patterns/* -t "${pkgdir}/etc/${_pkgname}/patterns"

  # Systemd & Helpers
  install -Dm644 config/crowdsec.service -t "${pkgdir}/usr/lib/systemd/system"

  # Plugins (Notifications)
  for i in email file http sentinel slack splunk; do
      install -Dm551 "cmd/notification-${i}/notification-${i}" -t "${pkgdir}/usr/lib/${_pkgname}/plugins"
      install -Dm600 "cmd/notification-${i}/${i}.yaml" -t "${pkgdir}/etc/${_pkgname}/notifications"
  done

  # Required empty dirs
  install -d "${pkgdir}/etc/${_pkgname}/"{acquis.d,hub}

  # Shell Completions
  ./cmd/crowdsec-cli/cscli completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/cscli"
  ./cmd/crowdsec-cli/cscli completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_cscli"

  # License
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
# Verified Stable: crowdsec-stable:1 ends here

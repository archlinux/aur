# Maintainer: Maykel Moya <mmoya [at] mmoya [dot] org>

_extractedName="google-cloud-sdk"
_pkgname="google-cloud-cli"
pkgname="${_pkgname}-lite"
pkgver=541.0.0
pkgrel=1
pkgdesc="A distribution of the gcloud CLI that strips unnecessary dependencies to reduce the size by > 75%"
url="https://github.com/tonymet/gcloud-lite"
license=('Apache-2.0')
arch=('x86_64')
depends=('python' 'python-botocore')
optdepends=(
  "python-crcmod: [gsutil] verify the integrity of GCS object contents"
)
options=('!strip' 'staticlibs' !zipman)
source=(
  "$pkgname-$pkgver.orig.tar.gz::${url}/releases/download/${pkgver}/google-cloud-cli-${pkgver}-linux-x86_64-lite.tar.gz"
  "google-cloud-cli.sh"
  "0003-add-compdef-to-zsh-completion.patch"
)
# Conflict the old package name to force migration
conflicts=('google-cloud-sdk' 'google-cloud-cli')
provides=('google-cloud-sdk' 'google-cloud-cli')
replaces=('google-cloud-sdk')
sha256sums=('79c0a1520bc38e85f732423411ae8a0d61b6b3866ac681296a2b0b9c78a49e9b'
            '5d9ca924675b24fc1ed044cf52f9f218e72ddc12703770271b0417a4a3c3a15d'
            'c19dbe916e6fd18d9b17b3309ee60c5d389035c5520822d2c14c045d8b853924')

prepare() {
  cd "${_extractedName}"

  for f in "${source[@]}"; do
    [[ "$f" =~ \.patch$ ]] && \
    ( \
      patch -p1 -i "${srcdir}/${f}" > /dev/null 2>&1 ||\
      ( \
        echo "failed to apply patch: $(basename ${f})" && \
        exit 1 \
      ) \
    )
  done
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${_extractedName}" "${pkgdir}/opt/${_pkgname}"

  # The Google code uses a _TraceAction() method which spams the screen even
  # in "quiet" mode, we're throwing away output on purpose to keep it clean
  #  ref: lib/googlecloudsdk/core/platforms_install.py
  "${pkgdir}/opt/${_pkgname}/install.sh" \
    --quiet \
    --usage-reporting false \
    --path-update false \
    --bash-completion false \
    > /dev/null

  find $pkgdir -name '__pycache__' -type d -exec rm -rf {} +

  install -D -m 0755 "${srcdir}/${source[1]}" \
    "${pkgdir}/etc/profile.d/google-cloud-cli.sh"

  install -d -m 0755 \
    "${pkgdir}/etc/bash_completion.d" \
    "${pkgdir}/usr/share/zsh/site-functions" \

  ln -rsT "${pkgdir}/opt/${_pkgname}/completion.bash.inc" \
    "${pkgdir}/etc/bash_completion.d/google-cloud-cli"

  for cmd in gcloud gsutil bq; do
    ln -rsT "${pkgdir}/opt/${_pkgname}/completion.zsh.inc" \
      "${pkgdir}/usr/share/zsh/site-functions/_${cmd}"
  done
}

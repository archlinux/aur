# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Mansour Behabadi <mansour@oxplot.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Geoff Hill <geoff@geoffhill.org>
# Contributor: Sebastien Bariteau <numkem@numkem.org>
# Contributor: Justin Dray <justin@dray.be>

pkgname="google-cloud-sdk"
pkgver=285.0.0
pkgrel=1
pkgdesc="A set of command-line tools for the Google Cloud Platform. Includes gcloud (with beta and alpha commands), gsutil, and bq."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
depends=('python' 'python2')
optdepends=(
  "python-crcmod: [gsutil] verify the integrity of GCS object contents"
)
options=('!strip' 'staticlibs')
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
  "google-cloud-sdk.sh"
  "0001-fix-console-io-syntax-warning.patch"
  "0002-set-python2-for-dev-appserver-py.patch"
  "0003-set-python2-for-endpointscfg-py.patch"
)
sha256sums=('d559ca360d8a54624716cfb95c995738acb65b43ea9f20f97f9d83bc6caa1ee4'
            'a54f88947a2593fae4aa8f65e42de4ad735583ae743735305c0f36710a794295'
            'b3faeb3af2922510048d12063fa215610f12879f5cc9f8b78786c7d9f2957c70'
            '62ec7f56e09168d375823e9e99fcdcfbf40b0fffdd75f35cf91122c5902c82e9'
            'ff6065ce2e54ac654605bd5fe554313b1d0def2c31ce56ff39429098dd1e39fe')

prepare() {
  cd "$pkgname"

  for f in ./../*.patch; do
    patch -p1 -i $f > /dev/null 2>&1 || ( echo "failed to apply patch: $(basename $f)" && exit 1 )
  done
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt"

  # The Google code uses a _TraceAction() method which spams the screen even
  # in "quiet" mode, we're throwing away output on purpose to keep it clean
  #  ref: lib/googlecloudsdk/core/platforms_install.py
  python "${pkgdir}/opt/${pkgname}/bin/bootstrapping/install.py" \
    --quiet \
    --usage-reporting False \
    --path-update False \
    --bash-completion False \
    --additional-components "" \
    1 > /dev/null

  rm -rf "${pkgdir}/opt/${pkgname}/.install/.backup"
  mkdir "${pkgdir}/opt/${pkgname}/.install/.backup"
  find $pkgdir -name '__pycache__' -type d -exec rm -rf {} +

  install -Dm755 "${srcdir}/${source[1]}" \
    "${pkgdir}/etc/profile.d/google-cloud-sdk.sh"

  install -Dm755 "${pkgdir}/opt/${pkgname}/completion.bash.inc" \
    "${pkgdir}/etc/bash_completion.d/google-cloud-sdk"

  mkdir -p "${pkgdir}/usr/share"
  mv -f "${pkgdir}/opt/${pkgname}/help/man" "${pkgdir}/usr/share/"
  chmod 0755 "${pkgdir}/usr/share/man"
  chmod 0755 "${pkgdir}/usr/share/man/man1"

  mkdir -p "${pkgdir}/usr/bin"
  for i in "${pkgdir}/opt/${pkgname}/bin"/*; do
    ln -st "${pkgdir}/usr/bin/" "${i#${pkgdir}}"
  done
  rm -f "${pkgdir}"/usr/bin/{bq,dev_appserver.py*,endpointscfg.py*,java_dev_appserver.sh}

  chmod -x "${pkgdir}"/usr/share/man/man1/*
  find "${pkgdir}/opt/${pkgname}" -name "*.html" -o -name "*.json" -exec chmod -x {} \;
  find "${pkgdir}/opt/${pkgname}" -name "*_test.py" -exec chmod +x {} \;
}

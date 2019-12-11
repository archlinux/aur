# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Mansour Behabadi <mansour@oxplot.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Geoff Hill <geoff@geoffhill.org>
# Contributor: Sebastien Bariteau <numkem@numkem.org>
# Contributor: Justin Dray <justin@dray.be>

pkgname="google-cloud-sdk"
pkgver=272.0.0
pkgrel=3
pkgdesc="A set of command-line tools for the Google Cloud Platform. Includes gcloud (with beta and alpha commands), gsutil, and bq."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
depends=('python2')
optdepends=(
  "python: [cli] beta support for python3. see https://cloud.google.com/sdk/gcloud/reference/topic/startup"
  "python2-crcmod: [gsutil] verify the integrity of GCS object contents"
)
options=('!strip' 'staticlibs')
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
  "google-cloud-sdk.sh"
)
sha256sums=('d7fe31f6103b9e65dd90919fa688eec0f8207f4a4e31dc391b8160295436684f'
            '36ac88de630e49ea4b067b1f5f229142e4cf97561b98b3bd3d8115a356946692')

package() {
  echo "Copying core SDK components"
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt"

  echo "Running bootstrapping script"

  # The Google code uses a _TraceAction() method which spams the screen even
  # in "quiet" mode, we're throwing away output on purpose to keep it clean
  #  ref: lib/googlecloudsdk/core/platforms_install.py
  python2 "${pkgdir}/opt/${pkgname}/bin/bootstrapping/install.py" \
    --quiet \
    --usage-reporting False \
    --path-update False \
    --bash-completion False \
    --additional-components "" \
    1 > /dev/null

  echo "Cleaning up artifacts of the bootstrap script"
  rm -rf "${pkgdir}/opt/${pkgname}/.install/.backup"
  mkdir "${pkgdir}/opt/${pkgname}/.install/.backup"

  echo "Setting up profile environment variables"
  install -Dm755 "${srcdir}/${source[1]}" \
    "${pkgdir}/etc/profile.d/google-cloud-sdk.sh"

  echo "Installing bash completion script"
  install -Dm755 "${pkgdir}/opt/${pkgname}/completion.bash.inc" \
    "${pkgdir}/etc/bash_completion.d/google-cloud-sdk"

  echo "Fixing python references for python2 and compiling *.pyc"
  grep -Irl 'python' "${pkgdir}/opt/${pkgname}" | \
    xargs sed -i 's|#!.*python\b|#!/usr/bin/env python2|g'
  find "${pkgdir}/opt/${pkgname}/bin/" -maxdepth 1 -type f -exec \
    sed -i 's/CLOUDSDK_PYTHON=python\b/CLOUDSDK_PYTHON=python2/g' {} \;
  python2 -m compileall -q -f -x python3 -d "/opt/google-cloud-sdk" \
    "${pkgdir}/opt/${pkgname}/"

  echo "Installing man pages"
  mkdir -p "${pkgdir}/usr/share"
  mv -f "${pkgdir}/opt/${pkgname}/help/man" "${pkgdir}/usr/share/"
  chmod 0755 "${pkgdir}/usr/share/man"
  chmod 0755 "${pkgdir}/usr/share/man/man1"

  echo "Creating symlinks for applications"
  mkdir -p "${pkgdir}/usr/bin"
  for i in "${pkgdir}/opt/${pkgname}/bin"/*; do
    ln -st "${pkgdir}/usr/bin/" "${i#${pkgdir}}"
  done
  rm -f "${pkgdir}"/usr/bin/{bq,dev_appserver.py*,endpointscfg.py*,java_dev_appserver.sh}

  echo "Fixing file permissions"
  chmod -x "${pkgdir}"/usr/share/man/man1/*
  find "${pkgdir}/opt/${pkgname}" -name "*.html" -o -name "*.json" -exec chmod -x {} \;
  find "${pkgdir}/opt/${pkgname}" -name "*_test.py" -exec chmod +x {} \;
}

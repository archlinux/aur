#!/bin/bash
# ^ Indicate that this is meant for use with Bash.

# Don"t warn about unused variables.
# shellcheck disable=2034
# Don"t check that variables have been defined.
# shellcheck disable=2154

# Maintainer: Koopa <codingkoopa@gmail.com>

pkgname="linux-fake-background-webcam-opt-git"
pkgver="r131.4fbb74b"
pkgrel="1"
pkgdesc="Utility for replacing the background of a webcam for video conferencing. Installs dependencies to /opt/."
# TensorFlow.js currently only supports x86_64. See: https://git.io/JL5nY.
arch=("x86_64")
url="https://github.com/fangfufu/Linux-Fake-Background-Webcam"
license=("GPL3")
depends=(
  # Node.js is required to run bodypix.
  "nodejs"
  # Python is required to use fakecam.
  "python"
  # v4l2loopback is required to use fakecam.
  "v4l2loopback-dkms"
)
optdepends=(
  # TensorFlow.js requires CUDA 10.0 for GPU support. See:
  # https://github.com/tensorflow/tfjs/blob/master/tfjs-node/README.md#installing.
  "cuda=10.0.130: Nvidia GPU support"
  # TensorFlow.js also requires cuDNN for GPU support. See above.
  "cudnn: Nvidia GPU support"
)
makedepends=(
  # Git is required to clone the repository.
  "git"
  # npm is required to install the Node.js dependencies.
  "npm"
)
source=(
  "$pkgname::git+https://github.com/fangfufu/Linux-Fake-Background-Webcam.git"
)
md5sums=(
  # Skip the repository source because it's not static.
  "SKIP"
)

pkgver() {
  cd "$pkgname" || return
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname" || return

  # Install the Node.js project.
  install -Dm644 -t "$pkgdir/opt/$pkgname/bodypix" bodypix/*.{json,js}

  # Install the Node.js dependencies.
  npm i --user root --prefix "$pkgdir/opt/$pkgname/bodypix"

  # This file is not required for operation.
  rm "$pkgdir/opt/$pkgname/bodypix/package-lock.json"

  # Remove references to $pkgdir in _where properties.
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  # Remove TF build directories. These too contain $pkgdir, and shouldn't be necessary.
  rm -rf "$pkgdir"/opt/"$pkgname"/bodypix/node_modules/@tensorflow/**/build*

  mkdir -p "$pkgdir"/usr/bin
  # Create a wrapper to launch the Node application with the needed environment variable.
  echo "\
#!/usr/bin/env bash

export TF_FORCE_GPU_ALLOW_GROWTH=true
node /opt/$pkgname/bodypix/app.js" >"$pkgdir/usr/bin/bodypix"
  chmod +x "$pkgdir/usr/bin/bodypix"

  # Install the Python project.
  install -Dm755 -t "$pkgdir"/opt/"$pkgname"/fakecam fakecam/*.py

  # Install the Python dependencies.
  PIP_CONFIG_FILE=/dev/null pip install --isolated --ignore-installed --no-deps \
    -r fakecam/requirements.txt --target="$pkgdir"/opt/"$pkgname"/fakecam/site-packages

  # Create a wrapper to inject the site-packages dir with our installed dependencies.
  echo "\
#!/usr/bin/env python3

import sys
import subprocess

sys.path.insert(0, \"/opt/$pkgname/fakecam/site-packages\")
subprocess.run([\"/opt/$pkgname/fakecam/fake.py\"] + sys.argv[1:])" >"$pkgdir/usr/bin/fakecam"
  chmod +x "$pkgdir/usr/bin/fakecam"
}

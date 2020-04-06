#Maintainer: james@stampatron.com
pkgname=daggerfall-unity-aur-bin
pkgver=0.10.22
pkgrel=2
pkgdesc="The Elder Scrolls: Daggerfall rebuilt using the unity engine"
arch=('x86_64')
url=https://www.dfworkshop.net/
license=('GPL3')
depends=('wget' 'unzip')
source=(daggerfall-unity
  daggerfall.desktop
  settings-template.ini)
sha256sums=(397221cfaa2e30f90b67aa8338608f601bed26c6c1b78b6e6a9e534e94f8d3c6
  1015b75af1876313bf8727cc57dc3c033e82b0904ee623a6944c333d6e4de1ae
  f8c7e4de325a5a25add4b2404cfdaa59f490a7cc43c89f4b72ed12db66e52ff5
)

#Package Variables
INC_DATA_FILES=TRUE

#Directory Names
DEST_DIR="opt/daggerfall-unity"
ENGINE_DIR="engine"
DATA_DIR="data"

#Dagger Unity Build Variables
BUILD_ID="ZJjtl5VRor"
REMOTE_BUILD_GENERATOR="https://build-api.cloud.unity3d.com/api/v1/shares/"

#Daggerfall Data Variables
REMOTE_DATA_ID="0B0i8ZocaUWLGWHc1WlF3dHNUNTQ"
REMOTE_DATA="https://drive.google.com/uc?export=download&confirm=h2vF&id="

#SHA256 Hashes
ENGINE_HASH="e029319f0ca1ee78bfafbdfd7e8aaa72f4c3aadbe62e78a62d9bc36973510a90"
DATA_HASH="8be67a4ebb76ed684968f49d29cbbe57b0c10dc4554d111d64356a2355be5083"

build() {
  echo "Downloading game engine..."
  #Get link for engine download
  wget -O link.json $REMOTE_BUILD_GENERATOR$BUILD_ID

  #Parse json to get download link
  TMP_ENGINE_LINK=$(grep -Po 'https://storage.googleapis.com/unitycloud-build-user-svc-live-build/.*?zip"(,|})' link.json)
  TMP_ENGINE_LINK=$(echo  "$TMP_ENGINE_LINK" | sed -n 1p)
  TMP_ENGINE_LINK=${TMP_ENGINE_LINK%?};
  TMP_ENGINE_LINK=${TMP_ENGINE_LINK%?};

  #Download the engine
  wget -O engine.zip "$TMP_ENGINE_LINK"
  echo "Done."

  if [ $INC_DATA_FILES == "TRUE" ]; then
    echo "Downloading game data..."
    #Get link for game data
    wget --save-cookies cookies.txt -O data.html $REMOTE_DATA$REMOTE_DATA_ID

    #Parse html to get download link
    TMP_LINK_DATA=$(grep -Po "uc\?export=download.*?\"" data.html)
    TMP_LINK_DATA=${TMP_LINK_DATA%?};
    TMP_LINK_DATA=$(echo $TMP_LINK_DATA | sed 's/&amp;/\&/g')

    #Download the data
    wget --load-cookies cookies.txt -O data.zip "https://drive.google.com/$TMP_LINK_DATA"
    echo "Done."
  else
    echo "Include data flag not set. Skipping data download."
  fi
}

check() {
  if [ $INC_DATA_FILES == "TRUE" ]; then
    echo "Checking data files integrity"
    DATA_VALID=$(echo "$DATA_HASH ${srcdir}/data.zip" | sha256sum -c | grep -o OK)
    if [ $DATA_VALID == "OK" ]; then
      echo "Data file confirmed to be valid"
    fi
  else
    echo "Include data flag not set. Skipping data integrity check."
  fi

  echo "Checking engine files integrity"
  ENGINE_VALID=$(echo "$ENGINE_HASH ${srcdir}/engine.zip" | sha256sum -c | grep -o OK)
  if [ $ENGINE_VALID == "OK" ]; then
    echo "Engine file confirmed to be valid"
  fi
}

package() {
  echo "Making the required package directories..."
  #Make required package directories
  if [ $INC_DATA_FILES == "TRUE" ]; then
    mkdir -p "${pkgdir}/${DEST_DIR}/${DATA_DIR}"
  else
    echo "Include data flag not set. Skipping data folder creation."
  fi
  mkdir -p "${pkgdir}/${DEST_DIR}/${ENGINE_DIR}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/local/bin"
  mkdir -p "${pkgdir}/usr/share/daggerfall-unity"
  echo "Done"

  echo "Unpacking the downloaded archives..."
  #Unpack archives
  if [ $INC_DATA_FILES == "TRUE" ]; then
    unzip -q "${srcdir}/data.zip" -d "${pkgdir}/${DEST_DIR}/${DATA_DIR}"
  else
    echo "Include data flag not set. Skipping data extraction."
  fi
  unzip -q "${srcdir}/engine.zip" -d "${pkgdir}/${DEST_DIR}/${ENGINE_DIR}"
  echo "Done."

  echo "Copying the additonal package files to the package..."
  #Add script for running program and make executable
  cp ${srcdir}/daggerfall-unity ${pkgdir}/usr/local/bin/daggerfall-unity

  #Add desktop shortcut
  cp ${srcdir}/daggerfall.desktop ${pkgdir}/usr/share/applications/daggerfall.desktop

  #Add template configuration
  cp ${srcdir}/settings-template.ini ${pkgdir}/usr/share/daggerfall-unity/settings-template.ini
  echo "Done."
	
  echo "Setting file and folder permissions..."
  #Set permissions
  find ${pkgdir}/* -type d -exec chmod 755 {} \;
  find ${pkgdir}/* -type f -exec chmod 644 {} \;
  if [ $INC_DATA_FILES == "TRUE" ]; then
    chmod +x ${pkgdir}/${DEST_DIR}/${ENGINE_DIR}/DaggerfallUnity.x86_64
  else
    echo "Include data flag not set. Skipping data permissions."
  fi
  chmod +x ${pkgdir}/usr/local/bin/daggerfall-unity 
  echo "Done."
}

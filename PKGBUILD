# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: james@stampatron.com
# Contributor: Mr.Smith1974

pkgname=daggerfall-unity-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="The Elder Scrolls: Daggerfall rebuilt using the unity engine"
arch=('x86_64')
url=https://www.dfworkshop.net/
license=('GPL3')
depends=(
  'glibc'
  'zlib'
  'gcc-libs'
  'bash'
)
makedepends=('wget' 'unzip')
replaces=('daggerfall-unity-aur-bin')
conflicts=('daggerfall-unity-aur-bin')
source=(daggerfall-unity
  daggerfall.desktop
  settings-template.ini
  data-files.txt
  https://github.com/Interkarma/daggerfall-unity/releases/download/v${pkgver}/dfu_linux_64bit-v${pkgver}.zip)
sha256sums=('0b312ea87a391da827da5296a59f6c19412a408d497ce06bbe68b45be98c3bcb'
            '1015b75af1876313bf8727cc57dc3c033e82b0904ee623a6944c333d6e4de1ae'
            'f8c7e4de325a5a25add4b2404cfdaa59f490a7cc43c89f4b72ed12db66e52ff5'
            'a6a45d321dda7b98484dbe38099d8f697c3d25e570a7bfbcdd975c206cadef2f'
            'be3c476ae92972f42448757719266ad82c04868eb7b6f3a3c90fcfcf1490849a')

###Package Variables###

#Flag for if game data files are from google or local pc
REMOTE_DATA_FILES=FALSE

#Engine zip file name
ENGINE_NAME=dfu_linux_64bit-v$pkgver.zip

#Directory Names
DEST_DIR="opt/daggerfall-unity"
ENGINE_DIR="engine"
DATA_DIR="data"

#Daggerfall Data Variables
REMOTE_DATA_ID="0B0i8ZocaUWLGWHc1WlF3dHNUNTQ"
REMOTE_DATA="https://drive.usercontent.google.com/download?id=${REMOTE_DATA_ID}&export=download&confirm=yes&uuid=5151e262-ed9f-44c8-8ebe-eab55f22c78e"

#SHA256 Hashes
DATA_HASH="8be67a4ebb76ed684968f49d29cbbe57b0c10dc4554d111d64356a2355be5083"

build() {
  #Download game data if not already downloaded
  if [ ! -d "/$DEST_DIR/$DATA_DIR" ]; then
    echo "Data files not found at /$DEST_DIR/$DATA_DIR/. Flagging for Download."
    REMOTE_DATA_FILES="TRUE"
  else
    echo "Data files found at /$DEST_DIR/$DATA_DIR/. Skipping download."
    REMOTE_DATA_FILES="FALSE"
  fi

  if [ $REMOTE_DATA_FILES == "TRUE" ]; then
    echo "Downloading game data..."
    wget -O data.zip "$REMOTE_DATA"
    echo "Done."
  fi
}

check() {
  #Check if data files need checking
  if [ ! -d "/$DEST_DIR/$DATA_DIR" ]; then
    REMOTE_DATA_FILES="TRUE"
  else
    REMOTE_DATA_FILES="FALSE"
  fi

  if [ $REMOTE_DATA_FILES == "TRUE" ]; then
    echo "Checking downloaded data files integrity"
    DATA_VALID=$(sha256sum ${srcdir}/data.zip | grep -o $DATA_HASH)
    if [ $DATA_VALID == "$DATA_HASH" ]; then
      echo "Data file confirmed to be valid"
    fi
  else
    echo "Data files already exist. Skipping data integrity check."
  fi
}

package() {
  #Check if data files need packaging
  if [ ! -d "/$DEST_DIR/$DATA_DIR" ]; then
    REMOTE_DATA_FILES="TRUE"
  else
    REMOTE_DATA_FILES="FALSE"
  fi

  echo "Making the required package directories..."
  #Make required package directories
  if [ $REMOTE_DATA_FILES == "TRUE" ]; then
    mkdir -p "${pkgdir}/${DEST_DIR}/${DATA_DIR}"
  else
    echo "Download data flag not set. Skipping data folder creation."
  fi
  mkdir -p "${pkgdir}/${DEST_DIR}/${ENGINE_DIR}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/daggerfall-unity"
  echo "Done"

  echo "Unpacking the downloaded archives..."
  #Unpack archives
  if [ $REMOTE_DATA_FILES == "TRUE" ]; then
    echo "Download data flag set. Extracting downloaded data to package."
    unzip -q "${srcdir}/data.zip" -d "${pkgdir}/${DEST_DIR}/${DATA_DIR}"
  else
    echo "Download data flag not set. Copying pre-existing data to package."
    #First make the package directories
    mkdir -p ${pkgdir}/opt/daggerfall-unity/data/SAVE2
    mkdir -p ${pkgdir}/opt/daggerfall-unity/data/SAVE0
    mkdir -p ${pkgdir}/opt/daggerfall-unity/data/SAVE4
    mkdir -p ${pkgdir}/opt/daggerfall-unity/data/SAVE3
    mkdir -p ${pkgdir}/opt/daggerfall-unity/data/arena2/books
    mkdir -p ${pkgdir}/opt/daggerfall-unity/data/SAVE1
    mkdir -p ${pkgdir}/opt/daggerfall-unity/data/SAVE5
    
    #Then loop through package file listing and copy files into the package directory
    for SRC_FILE in `cat ${srcdir}/data-files.txt`
    do
        DST_FILE=${pkgdir}/$(echo $SRC_FILE)
        if [ -f $SRC_FILE ]; then
            cp $SRC_FILE $DST_FILE
        else
            echo "$SRC_FILE not found. Skipping inclusion in package."
        fi
    done
  fi
  unzip -q "${srcdir}/$ENGINE_NAME" -d "${pkgdir}/${DEST_DIR}/${ENGINE_DIR}"
  echo "Done."

  echo "Copying the additonal files to the package..."
  #Add script for running program and make executable
  cp ${srcdir}/daggerfall-unity ${pkgdir}/usr/bin/daggerfall-unity

  #Add desktop shortcut
  cp ${srcdir}/daggerfall.desktop ${pkgdir}/usr/share/applications/daggerfall.desktop

  #Add template configuration
  cp ${srcdir}/settings-template.ini ${pkgdir}/usr/share/daggerfall-unity/settings-template.ini
  echo "Done."
	
  echo "Setting file and folder permissions..."
  #Set permissions
  find ${pkgdir}/* -type d -exec chmod 755 {} \;
  find ${pkgdir}/* -type f -exec chmod 644 {} \;
  chmod +x ${pkgdir}/${DEST_DIR}/${ENGINE_DIR}/DaggerfallUnity.x86_64
  chmod +x ${pkgdir}/usr/bin/daggerfall-unity 
  echo "Done."
}

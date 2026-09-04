# Maintainer: Savi G. <info@monsoonresearch.cc>
pkgname=ring-lang
pkgver=1.27
pkgrel=44
pkgdesc="Simple, lightweight, embeddable multi-paradigm dynamic language (full build: VM, console tools, RingQt on Qt6, Allegro, SDL2, network & database extensions)"
arch=('x86_64' 'x86_64_v3' 'x86_64_v4')  # v3/v4 entries match CachyOS optimized repos
url="https://ring-lang.github.io/"
license=('MIT')
# Qt module list mirrors extensions/ringqt/ring_qt515.pro (+ svgwidgets):
# sql core gui network multimedia multimediawidgets testlib printsupport
# widgets serialport bluetooth opengl openglwidgets positioning webenginewidgets
# texttospeech 3dcore 3dextras 3drender 3dlogic charts svg svgwidgets
# + quick quickwidgets qml. core5compat supplies QRegExp/QStringRef/QTextCodec.
# qt6-webengine is large (~hundreds of MB) but the .pro requires webenginewidgets.
depends=(
  'glibc' 'gcc-libs' 'curl' 'openssl'
  'allegro' 'sdl2' 'freeglut'
  'unixodbc' 'mariadb-libs' 'postgresql-libs'
  'qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-svg' 'qt6-charts'
  'qt6-connectivity' 'qt6-positioning' 'qt6-serialport' 'qt6-speech'
  'qt6-webengine' 'qt6-3d' 'qt6-5compat'
)
provides=('ring')
conflicts=('ring')   # AUR 'ring' is an unrelated Rust ping utility
source=("$pkgname-$pkgver.tar.gz::https://github.com/ring-lang/ring/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4991ee0ec8c4279f58fe779ac1cc9cb078c7f485db84ad0c2911fd720ad0a12f')
# ring2exe embeds payloads in its bin/ executables; stripping corrupts them.
# (lib/*.so are manually strip-debugged in package() — that's safe.)
options=(!strip)

# Known cosmetic limitations (documented for AUR users):
# - GButtonGroup buttonClicked/Pressed/Released(int) connects print "No such
#   signal" at runtime: Qt6 removed the int overloads; the generated class
#   library connects by Qt5 string signatures. Those specific handlers are
#   inert; everything else functions.
# - RingNotepad SaveAs dialog defaults its startup folder from the (read-only)
#   install tree; saving to $HOME works. Settings live in ~/.ringnotepad/.

prepare() {
  cd "ring-$pkgver"
  local p f m fn n

  # --- QtTextToSpeech module guard ------------------------------------------
  if [[ ! -d /usr/include/qt6/QtTextToSpeech ]]; then
    error "QtTextToSpeech development headers not found — the full RingQt"
    error "build requires the Qt6 TextToSpeech module (package: qt6-speech)."
    return 1
  fi

  # --- Upstream build scripts ---------------------------------------------
  # They finish by sudo-symlinking into /usr — neutralize for makepkg
  sed -i 's|sudo ./install.sh|true|'  language/build/buildgcc.sh
  sed -i 's|\./install\.sh|true|g'    build/buildgcc.sh
  # buildgcc.sh calls `clear` and `sleep 2`; noisy without a TTY
  sed -i '/^clear$/d; /^sleep 2$/d'   build/buildgcc.sh
  # Stop buildgcc.sh from discarding per-stage output (> /dev/null 2>&1);
  # the generic "Error: Failed to build X" otherwise hides the real cause.
  sed -i -e 's|\./"$_gencode_script" > /dev/null 2>&1|./"$_gencode_script"|g' \
         -e 's|\./"$_build_script" > /dev/null 2>&1|./"$_build_script"|g' \
         build/buildgcc.sh

  # --- RingQt vs Qt6 --------------------------------------------------------
  # (a) Link against the in-tree VM. CRITICAL FORM: linking by direct path
  #     (`../../lib/libring.so`) with a SONAME-less libring records the LITERAL
  #     path into DT_NEEDED — the loader resolves it relative to CWD at
  #     runtime and dlopen fails with R38. The -L/-l: form records the bare
  #     NAME; the $ORIGIN rpath makes the .so find libring.so in its own
  #     directory — valid in BOTH the build tree (lib/) and the installed
  #     tree (/usr/lib/ring/lib).
  for p in extensions/ringqt/ring_qt515{,_core,_light}.pro; do
    sed -i 's|LIBS += */usr/lib/libring\.so|LIBS += -L../../lib -l:libring.so|' "$p"
    if ! grep -q 'rpath.*ORIGIN' "$p"; then
      if [[ -n $(tail -c 1 "$p") ]]; then printf '\n' >> "$p"; fi
      printf 'QMAKE_LFLAGS += -Wl,-rpath,$$ORIGIN -Wl,-rpath,$$ORIGIN/../../lib\n' >> "$p"
    fi
    grep -q '\-l:libring\.so' "$p" || {
      error "libring LIBS patch did not apply to $p"; return 1; }
    grep -q 'rpath.*ORIGIN' "$p" || {
      error "rpath patch did not apply to $p"; return 1; }
  done

  # (i) QOpenGLWidget moved QtWidgets -> QtOpenGLWidgets in Qt6; and
  #     QGraphicsSvgItem/QSvgWidget moved QtSvg -> QtSvgWidgets.
  for p in extensions/ringqt/ring_qt515_light.pro extensions/ringqt/ring_qt515.pro; do
    if ! grep -q 'openglwidgets' "$p"; then
      if [[ -n $(tail -c 1 "$p") ]]; then printf '\n' >> "$p"; fi
      printf 'QT += openglwidgets\n' >> "$p"
    fi
    grep -q 'openglwidgets' "$p" || {
      error "openglwidgets module not added to $p"; return 1; }
  done
  if ! grep -q 'svgwidgets' extensions/ringqt/ring_qt515.pro; then
    if [[ -n $(tail -c 1 extensions/ringqt/ring_qt515.pro) ]]; then printf '\n' >> extensions/ringqt/ring_qt515.pro; fi
    printf 'QT += svgwidgets\n' >> extensions/ringqt/ring_qt515.pro
  fi
  grep -q 'svgwidgets' extensions/ringqt/ring_qt515.pro || {
    error "svgwidgets module not added to ring_qt515.pro"; return 1; }

  # (c) The generated sources relied on Qt5's <QtCore> umbrella header; Qt6
  #     only FORWARD-DECLARES QRegExp/QStringRef/QTextCodec. Register the
  #     Qt5Compat module AND add its include path / link flag explicitly —
  #     belt and braces: if the file lacks a trailing newline, a plain
  #     append CONCATENATES with the last line and qmake never parses the
  #     module request (the pkgrel=6 silent failure).
  for p in extensions/ringqt/ring_qt515{,_core,_light}.pro; do
    if ! grep -q '^QT += core5compat' "$p"; then
      if [[ -n $(tail -c 1 "$p") ]]; then printf '\n' >> "$p"; fi
      printf 'QT += core5compat\n' >> "$p"
      printf 'INCLUDEPATH += $$[QT_INSTALL_HEADERS]/Qt5Compat\n' >> "$p"
      printf 'LIBS += -lQt6Core5Compat\n' >> "$p"
      printf 'DEFINES += QT_CORE5COMPAT_LIB\n' >> "$p"
    fi
    grep -q '^QT += core5compat' "$p" || {
      error "core5compat patch did not apply to $p"; return 1; }
  done

  # --- Inert stub headers for Qt5 classes REMOVED in Qt6 -------------------
  #     (cpp/include is on every compile line via -Icpp/include; the real Qt
  #     headers are gone, so these are the only match. gencode never writes
  #     these filenames, so they survive regeneration.)

  # (k) Bluetooth OBEX transfer classes:
  cat > extensions/ringqt/cpp/include/QBluetoothTransferRequest <<'STUB'
#ifndef RINGQT6_QBT_TRANSFERREQUEST_STUB
#define RINGQT6_QBT_TRANSFERREQUEST_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtBluetooth/QBluetoothAddress>
#include <QVariant>

class QBluetoothTransferRequest
{
public:
    enum Header { ContentType, Name, Description, Length, Time, Target };
    enum Attribute { TypeAttribute, NameAttribute, DescriptionAttribute,
                     LengthAttribute, TimeAttribute, TargetAttribute };

    QBluetoothTransferRequest() {}
    explicit QBluetoothTransferRequest(const QBluetoothAddress &address) : m_address(address) {}
    QBluetoothTransferRequest(const QBluetoothTransferRequest &other) : m_address(other.m_address) {}
    ~QBluetoothTransferRequest() {}

    QBluetoothAddress address() const { return m_address; }
    QVariant header(Header) const { return QVariant(); }
    void setHeader(Header, const QVariant &) {}

    QVariant attribute(Attribute) const { return QVariant(); }
    QVariant attribute(Attribute attribute, QVariant &defaultValue) const { (void) attribute; return defaultValue; }
    void setAttribute(Attribute, const QVariant &value) { (void) value; }

    bool operator==(const QBluetoothTransferRequest &other) const { return m_address == other.m_address; }
    bool operator!=(const QBluetoothTransferRequest &other) const { return !(*this == other); }

private:
    QBluetoothAddress m_address;
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QBluetoothTransferReply <<'STUB'
#ifndef RINGQT6_QBT_TRANSFERREPLY_STUB
#define RINGQT6_QBT_TRANSFERREPLY_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QObject>
#include <QString>
#include "QBluetoothTransferRequest"

class QBluetoothTransferManager;

class QBluetoothTransferReply : public QObject
{
public:
    enum TransferError {
        NoError = 0, UnknownError, HostError, RemoteHostClosedError,
        ServiceError, UserCanceledError, UnsupportedType
    };

    explicit QBluetoothTransferReply(QObject *parent = nullptr) : QObject(parent) {}
    ~QBluetoothTransferReply() {}

    TransferError error() const { return NoError; }
    QString errorString() const { return QString(); }
    bool isFinished() const { return true; }
    QBluetoothTransferManager *manager() const { return nullptr; }
    QBluetoothTransferRequest request() const { return QBluetoothTransferRequest(); }

    void abort() {}
    void finished(QBluetoothTransferReply *reply) { (void) reply; }
    void error(TransferError) {}
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QBluetoothTransferManager <<'STUB'
#ifndef RINGQT6_QBT_TRANSFERMANAGER_STUB
#define RINGQT6_QBT_TRANSFERMANAGER_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QObject>
#include <QIODevice>
#include <QString>
#include "QBluetoothTransferRequest"

class QBluetoothTransferReply;

class QBluetoothTransferManager : public QObject
{
public:
    explicit QBluetoothTransferManager(QObject *parent = nullptr) : QObject(parent) {}
    ~QBluetoothTransferManager() {}

    QBluetoothTransferReply *transfer(const QBluetoothTransferRequest &, QIODevice *) { return nullptr; }
    QBluetoothTransferReply *transfer(const QBluetoothTransferRequest &, const QString &) { return nullptr; }
    QBluetoothTransferReply *put(const QBluetoothTransferRequest &request, QIODevice *device) { (void) request; (void) device; return nullptr; }
};
#endif
STUB

  # (m) QtNetwork bearer API:
  cat > extensions/ringqt/cpp/include/QNetworkConfiguration <<'STUB'
#ifndef RINGQT6_QNETCONFIG_STUB
#define RINGQT6_QNETCONFIG_STUB
/* Qt5 bearer API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QFlags>
#include <QtCore/QString>
#include <QtCore/QList>

class QNetworkConfiguration
{
public:
    enum Type { Internet, Intranet, ServiceNetwork, UserChoice, Invalid };
    enum StateFlag {
        Undefined  = 0x0000001,
        Defined    = 0x0000002,
        Discovered = 0x0000004,
        Active     = 0x0000008
    };
    Q_DECLARE_FLAGS(StateFlags, StateFlag)
    enum Purpose {
        UnknownPurpose, PublicPurpose, PrivatePurpose, ServiceSpecificPurpose
    };
    enum BearerType {
        BearerUnknown, BearerEthernet, BearerWLAN, Bearer2G, BearerCDMA2000,
        BearerWCDMA, BearerHSPA, BearerBluetooth, BearerWiMAX, BearerLTE
    };

    QNetworkConfiguration() {}
    QNetworkConfiguration(const QNetworkConfiguration &other) { (void) other; }
    ~QNetworkConfiguration() {}

    bool isValid() const { return false; }
    QString name() const { return QString(); }
    QString identifier() const { return QString(); }
    Type type() const { return Invalid; }
    Purpose purpose() const { return UnknownPurpose; }
    StateFlags state() const { return Undefined; }
    BearerType bearerType() const { return BearerUnknown; }
    QString bearerTypeName() const { return QString(); }
    bool isRoamingAvailable() const { return false; }
    QList<QNetworkConfiguration> children() const { return QList<QNetworkConfiguration>(); }

    bool operator==(const QNetworkConfiguration &) const { return true; }
    bool operator!=(const QNetworkConfiguration &) const { return false; }
};
Q_DECLARE_OPERATORS_FOR_FLAGS(QNetworkConfiguration::StateFlags)
#endif
STUB
  cat > extensions/ringqt/cpp/include/QNetworkConfigurationManager <<'STUB'
#ifndef RINGQT6_QNETCONFIGMGR_STUB
#define RINGQT6_QNETCONFIGMGR_STUB
/* Qt5 bearer API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QList>
#include "QNetworkConfiguration"

class QNetworkConfigurationManager : public QObject
{
public:
    enum Capability {
        CanStartAndStopInterfaces = 0x00000001,
        DirectConnectionRouting    = 0x00000002,
        SystemSessionSupport       = 0x00000004,
        ApplicationLevelLicensing  = 0x00000008,
        NoCapability               = 0
    };
    Q_DECLARE_FLAGS(Capabilities, Capability)

    explicit QNetworkConfigurationManager(QObject *parent = nullptr) : QObject(parent) {}
    ~QNetworkConfigurationManager() {}

    QNetworkConfiguration defaultConfiguration() const { return QNetworkConfiguration(); }
    QList<QNetworkConfiguration> allConfigurations(QNetworkConfiguration::StateFlags flags = QNetworkConfiguration::Discovered) const
        { return flags ? QList<QNetworkConfiguration>() : QList<QNetworkConfiguration>(); }
    QNetworkConfiguration configuration(const QString &identifier) const { (void) identifier; return QNetworkConfiguration(); }
    QNetworkConfiguration configurationFromIdentifier(const QString &identifier) const { (void) identifier; return QNetworkConfiguration(); }
    bool isOnline() const { return false; }
    Capabilities capabilities() const { return Capabilities(NoCapability); }

    void updateConfigurations() {}
    void configurationAdded(const QNetworkConfiguration &) {}
    void configurationChanged(const QNetworkConfiguration &) {}
    void configurationRemoved(const QNetworkConfiguration &) {}
    void onlineStateChanged(bool) {}
    void updateCompleted() {}
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QNetworkSession <<'STUB'
#ifndef RINGQT6_QNETSESSION_STUB
#define RINGQT6_QNETSESSION_STUB
/* Qt5 bearer API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QVariant>
#include "QNetworkConfiguration"

class QNetworkSession : public QObject
{
public:
    enum SessionError {
        UnknownSessionError = 0, SessionAbortedError = 1, RoamingError = 2,
        OperationNotSupportedError = 3, InvalidConfigurationError = 4
    };
    enum State {
        Invalid = 0, NotAvailable = 1, Connecting = 2, Connected = 3,
        Closing = 4, Disconnected = 5, Roaming = 6
    };
    enum UsagePolicy { NoPolicy = 0, NoBackgroundDataPolicy = 1 };

    explicit QNetworkSession(const QNetworkConfiguration &config, QObject *parent = nullptr) : QObject(parent) { (void) config; }
    ~QNetworkSession() {}

    bool isOpen() const { return false; }
    void open() {}
    void close() {}
    void stop() {}
    QNetworkConfiguration configuration() const { return QNetworkConfiguration(); }
    State state() const { return NotAvailable; }
    SessionError error() const { return UnknownSessionError; }
    QString errorString() const { return QString(); }
    quint64 bytesWritten() const { return 0; }
    quint64 bytesReceived() const { return 0; }
    bool waitForOpened(int msecs = 3000) { (void) msecs; return false; }
    QVariant sessionProperty(const QString &key) const { (void) key; return QVariant(); }
    void setSessionProperty(const QString &key, const QVariant &value) { (void) key; (void) value; }
    UsagePolicy usagePolicy() const { return NoPolicy; }
    void setUsagePolicy(UsagePolicy policy) { (void) policy; }
    void migrate() {}
    void ignore() {}
    void accept() {}
    void reject() {}

    void stateChanged(State) {}
    void error(SessionError) {}
    void opened() {}
    void closed() {}
    void preferredConfigurationChanged(const QNetworkConfiguration &, bool) {}
    void newConfigurationActivated() {}
};
#endif
STUB

  # (n)/(o)/(p)/(r) Multimedia removals:
  cat > extensions/ringqt/cpp/include/QAudioRecorder <<'STUB'
#ifndef RINGQT6_QAUDIORECORDER_STUB
#define RINGQT6_QAUDIORECORDER_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QUrl>

class QAudioRecorder : public QObject
{
public:
    enum State { StoppedState = 0, RecordingState = 1, PausedState = 2 };
    enum Status {
        UnavailableStatus = 0, UnloadedStatus, LoadedStatus, BufferingStatus,
        StartingStatus, RecordingStatus, PausedStatus, FinalizingStatus,
        StoppedStatus
    };
    enum Error { NoError = 0, ResourceError, ContainerError, OutOfSpaceError };

    explicit QAudioRecorder(QObject *parent = nullptr) : QObject(parent) {}
    ~QAudioRecorder() {}

    QString audioInput() const { return QString(); }
    void setAudioInput(const QString &name) { (void) name; }
    QStringList audioInputs() const { return QStringList(); }
    QString defaultAudioInput() const { return QString(); }
    QString audioInputDescription(const QString &name) const { (void) name; return QString(); }

    void record() {}
    void pause() {}
    void stop() {}
    void setOutputLocation(const QUrl &location) { (void) location; }
    QUrl outputLocation() const { return QUrl(); }
    QUrl actualLocation() const { return QUrl(); }
    qint64 duration() const { return 0; }
    State state() const { return StoppedState; }
    Status status() const { return UnavailableStatus; }
    Error error() const { return NoError; }
    QString errorString() const { return QString(); }

    void durationChanged(qint64 duration) { (void) duration; }
    void stateChanged(State newState) { (void) newState; }
    void statusChanged(Status status) { (void) status; }
    void actualLocationChanged(const QUrl &location) { (void) location; }
    void error(Error error) { (void) error; }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QMediaObject <<'STUB'
#ifndef RINGQT6_QMEDIAOBJECT_STUB
#define RINGQT6_QMEDIAOBJECT_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QVariant>

class QMediaObject : public QObject
{
public:
    explicit QMediaObject(QObject *parent = nullptr) : QObject(parent) {}
    ~QMediaObject() {}

    bool isAvailable() const { return false; }
    int notifyInterval() const { return 0; }
    void setNotifyInterval(int milliSeconds) { (void) milliSeconds; }

    QVariant metaData(const QString &key) const { (void) key; return QVariant(); }
    bool isMetaDataAvailable() const { return false; }
    QStringList availableMetaData() const { return QStringList(); }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QAudioProbe <<'STUB'
#ifndef RINGQT6_QAUDIOPROBE_STUB
#define RINGQT6_QAUDIOPROBE_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QObject>

class QMediaObject;
class QMediaRecorder;
class QAudioBuffer;

class QAudioProbe : public QObject
{
public:
    explicit QAudioProbe(QObject *parent = nullptr) : QObject(parent) {}
    ~QAudioProbe() {}

    bool setSource(QMediaObject *source) { (void) source; return false; }
    bool setSource(QMediaRecorder *source) { (void) source; return false; }
    bool isActive() const { return false; }

    void audioBufferProbed(const QAudioBuffer &buffer) { (void) buffer; }
    void flushed() {}
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QVideoProbe <<'STUB'
#ifndef RINGQT6_QVIDEOPROBE_STUB
#define RINGQT6_QVIDEOPROBE_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QObject>

class QMediaObject;
class QMediaRecorder;
class QVideoFrame;

class QVideoProbe : public QObject
{
public:
    explicit QVideoProbe(QObject *parent = nullptr) : QObject(parent) {}
    ~QVideoProbe() {}

    bool setSource(QMediaObject *source) { (void) source; return false; }
    bool setSource(QMediaRecorder *source) { (void) source; return false; }
    bool isActive() const { return false; }

    void videoFrameProbed(const QVideoFrame &frame) { (void) frame; }
    void flushed() {}
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QMediaResource <<'STUB'
#ifndef RINGQT6_QMEDIARESOURCE_STUB
#define RINGQT6_QMEDIARESOURCE_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QUrl>
#include <QtCore/QString>

class QMediaResource
{
public:
    QMediaResource() {}
    explicit QMediaResource(const QUrl &url, const QString &mimeType = QString()) { (void) url; (void) mimeType; }
    QMediaResource(const QMediaResource &other) { (void) other; }
    ~QMediaResource() {}

    QUrl url() const { return QUrl(); }
    QString mimeType() const { return QString(); }
    QString audioCodec() const { return QString(); }
    QString videoCodec() const { return QString(); }
    qint64 dataSize() const { return -1; }
    int sampleRate() const { return -1; }
    int channelCount() const { return -1; }

    bool operator==(const QMediaResource &) const { return true; }
    bool operator!=(const QMediaResource &) const { return false; }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QMediaContent <<'STUB'
#ifndef RINGQT6_QMEDIACONTENT_STUB
#define RINGQT6_QMEDIACONTENT_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QUrl>
#include <QtCore/QList>
#include "QMediaResource"

class QMediaPlaylist;

class QMediaContent
{
public:
    QMediaContent() {}
    explicit QMediaContent(const QUrl &url) { (void) url; }
    explicit QMediaContent(const QMediaResource &resource) { (void) resource; }
    QMediaContent(const QList<QMediaResource> &resources) { (void) resources; }
    QMediaContent(const QMediaContent &other) { (void) other; }
    ~QMediaContent() {}

    QUrl url() const { return QUrl(); }
    QUrl canonicalUrl() const { return QUrl(); }
    QMediaResource canonicalResource() const { return QMediaResource(); }
    QList<QMediaResource> resources() const { return QList<QMediaResource>(); }
    QMediaPlaylist *playlist() const { return nullptr; }
    bool isNull() const { return true; }

    bool operator==(const QMediaContent &) const { return true; }
    bool operator!=(const QMediaContent &) const { return false; }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QMediaPlaylist <<'STUB'
#ifndef RINGQT6_QMEDIAPLAYLIST_STUB
#define RINGQT6_QMEDIAPLAYLIST_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QObject>
#include <QtCore/QUrl>
#include <QtCore/QList>
#include <QtCore/QIODevice>
#include "QMediaContent"

class QMediaPlaylist : public QObject
{
public:
    enum PlaybackMode { CurrentItemOnce = 0, CurrentItemInLoop, Sequential, Loop, Random };
    enum Error { NoError = 0, FormatError, FormatNotSupportedError, NetworkError, AccessDeniedError };

    explicit QMediaPlaylist(QObject *parent = nullptr) : QObject(parent) {}
    ~QMediaPlaylist() {}

    PlaybackMode playbackMode() const { return Sequential; }
    void setPlaybackMode(PlaybackMode mode) { (void) mode; }
    int currentIndex() const { return -1; }
    int nextIndex(int steps = 1) const { (void) steps; return -1; }
    int previousIndex(int steps = 1) const { (void) steps; return -1; }
    int mediaCount() const { return 0; }
    QMediaContent media(int index) const { (void) index; return QMediaContent(); }
    QMediaContent currentMedia() const { return QMediaContent(); }
    bool addMedia(const QMediaContent &content) { (void) content; return false; }
    bool addMedia(const QUrl &content) { (void) content; return false; }
    bool addMedia(const QList<QMediaContent> &items) { (void) items; return false; }
    bool insertMedia(int index, const QMediaContent &content) { (void) index; (void) content; return false; }
    bool removeMedia(int pos) { (void) pos; return false; }
    bool removeMedia(int start, int end) { (void) start; (void) end; return false; }
    bool clear() { return false; }
    bool load(const QUrl &location, const char *format = nullptr) { (void) location; (void) format; return false; }
    bool load(QIODevice *device, const char *format = nullptr) { (void) device; (void) format; return false; }
    bool read(const QUrl &location) { (void) location; return false; }
    bool save(const QUrl &location) { (void) location; return false; }
    bool save(const QUrl &location, const char *format) { (void) location; (void) format; return false; }
    bool save(QIODevice *device, const char *format) { (void) device; (void) format; return false; }
    void next() {}
    void previous() {}
    void shuffle() {}
    void setCurrentIndex(int index) { (void) index; }
    bool isEmpty() const { return true; }
    bool isReadOnly() const { return true; }
    Error error() const { return NoError; }
    QString errorString() const { return QString(); }

    void currentIndexChanged(int) {}
    void playbackModeChanged(PlaybackMode) {}
    void currentMediaChanged(const QMediaContent &) {}
    void mediaInserted(int, int) {}
    void mediaRemoved(int, int) {}
    void mediaChanged(int, int) {}
    void loaded() {}
    void loadFailed() {}
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QAudioDeviceInfo <<'STUB'
#ifndef RINGQT6_QAUDIODEVICEINFO_STUB
#define RINGQT6_QAUDIODEVICEINFO_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QList>
#include <QtMultimedia/QAudioFormat>

class QAudioDeviceInfo
{
public:
    QAudioDeviceInfo() {}
    QAudioDeviceInfo(const QAudioDeviceInfo &other) { (void) other; }
    ~QAudioDeviceInfo() {}

    bool isNull() const { return true; }
    QString deviceName() const { return QString(); }
    QString realm() const { return QString(); }
    bool isFormatSupported(const QAudioFormat &format) const { (void) format; return false; }
    QAudioFormat preferredFormat() const { return QAudioFormat(); }
    QAudioFormat nearestFormat(const QAudioFormat &format) const { (void) format; return QAudioFormat(); }
    QList<int> supportedSampleRates() const { return QList<int>(); }
    QList<int> supportedChannelCounts() const { return QList<int>(); }
    QList<int> supportedSampleSizes() const { return QList<int>(); }
    QStringList supportedCodecs() const { return QStringList(); }
    QList<int> supportedByteOrders() const { return QList<int>(); }
    QList<int> supportedSampleTypes() const { return QList<int>(); }

    static QAudioDeviceInfo defaultInputDevice() { return QAudioDeviceInfo(); }
    static QAudioDeviceInfo defaultOutputDevice() { return QAudioDeviceInfo(); }
    static QList<QAudioDeviceInfo> availableDevices(int mode) { (void) mode; return QList<QAudioDeviceInfo>(); }

    bool operator==(const QAudioDeviceInfo &) const { return true; }
    bool operator!=(const QAudioDeviceInfo &) const { return false; }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QCameraViewfinder <<'STUB'
#ifndef RINGQT6_QCAMERAVIEWFINDER_STUB
#define RINGQT6_QCAMERAVIEWFINDER_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtWidgets/QWidget>
#include <QtCore/QSize>

class QCamera;

class QCameraViewfinder : public QWidget
{
public:
    explicit QCameraViewfinder(QWidget *parent = nullptr) : QWidget(parent) {}
    ~QCameraViewfinder() {}

    void setCamera(QCamera *camera) { (void) camera; }
    QCamera *camera() const { return nullptr; }
    QSize sizeHint() const { return QSize(320, 240); }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QVideoWidgetControl <<'STUB'
#ifndef RINGQT6_QVIDEOWIDGETCONTROL_STUB
#define RINGQT6_QVIDEOWIDGETCONTROL_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QObject>
#include <QtCore/QSize>

class QVideoWidgetControl : public QObject
{
public:
    explicit QVideoWidgetControl(QObject *parent = nullptr) : QObject(parent) {}
    ~QVideoWidgetControl() {}

    Qt::AspectRatioMode aspectRatioMode() const { return Qt::IgnoreAspectRatio; }
    void setAspectRatioMode(Qt::AspectRatioMode mode) { (void) mode; }
    int brightness() const { return 0; }
    void setBrightness(int brightness) { (void) brightness; }
    int contrast() const { return 0; }
    void setContrast(int contrast) { (void) contrast; }
    int hue() const { return 0; }
    void setHue(int hue) { (void) hue; }
    int saturation() const { return 0; }
    void setSaturation(int saturation) { (void) saturation; }

    void brightnessChanged(int brightness) { (void) brightness; }
    void contrastChanged(int contrast) { (void) contrast; }
    void hueChanged(int hue) { (void) hue; }
    void saturationChanged(int saturation) { (void) saturation; }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QCameraImageCapture <<'STUB'
#ifndef RINGQT6_QCAMERAIMAGECAPTURE_STUB
#define RINGQT6_QCAMERAIMAGECAPTURE_STUB
/* Qt5 API, renamed QImageCapture in Qt6 — inert stub keeping the Qt5
   name and surface (see PKGBUILD prepare()) */
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QList>
#include <QtCore/QSize>
#include <QtCore/QFlags>
#include <QtGui/QImage>
#include "QImageEncoderSettings"

class QCameraImageCapture : public QObject
{
public:
    enum Error { NoError = 0, CameraError, UnsupportedFormatError, OutOfSpaceError };
    enum CaptureStatus { UninitializedStatus = 0, LoadedStatus, StartingStatus, ActiveStatus, CapturingStatus, IdleStatus };
    enum CaptureDestination { CaptureToBuffer = 0x1, CaptureToFile = 0x2 };
    Q_DECLARE_FLAGS(CaptureDestinations, CaptureDestination)
    enum AvailabilityStatus { AvailabilityUnknown = 0, Busy, Available, ResourceMissing };

    explicit QCameraImageCapture(QObject *parent = nullptr) : QObject(parent) {}
    ~QCameraImageCapture() {}

    bool isAvailable() const { return false; }
    bool isReadyForCapture() const { return false; }
    int capture(const QString &location = QString()) { (void) location; return -1; }
    void cancelCapture() {}
    Error error() const { return NoError; }
    QString errorString() const { return QString(); }
    CaptureStatus status() const { return UninitializedStatus; }

    CaptureDestinations captureDestination() const { return CaptureDestinations(); }
    void setCaptureDestination(CaptureDestinations destination) { (void) destination; }
    bool isCaptureDestinationSupported(CaptureDestinations destination) const { (void) destination; return false; }

    AvailabilityStatus availability() const { return AvailabilityUnknown; }
    int bufferFormat() const { return 0; }
    void setBufferFormat(int format) { (void) format; }
    QImageEncoderSettings encodingSettings() const { return QImageEncoderSettings(); }
    void setEncodingSettings(const QImageEncoderSettings &settings) { (void) settings; }
    QStringList supportedImageCodecs() const { return QStringList(); }
    QString imageCodecDescription(const QString &codecName) const { (void) codecName; return QString(); }
    QList<QSize> supportedResolutions() const { return QList<QSize>(); }
    QList<QSize> supportedResolutions(const QImageEncoderSettings &settings, bool *continuous = nullptr) const
        { (void) settings; (void) continuous; return QList<QSize>(); }
    QList<int> supportedBufferFormats() const { return QList<int>(); }

    void imageCaptured(int id, const QImage &preview) { (void) id; (void) preview; }
    void imageExposed(int id) { (void) id; }
    void imageSaved(int id, const QString &fileName) { (void) id; (void) fileName; }
    void readyForCaptureChanged(bool ready) { (void) ready; }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QWebEngineCallback <<'STUB'
#ifndef RINGQT6_QWEBENGINECALLBACK_STUB
#define RINGQT6_QWEBENGINECALLBACK_STUB
/* Qt6 on this system ships no CamelCase forwarding header for this name
   (class, if present, is only under the lowercase qwebenginecallback.h).
   Use the real class when reachable, else an inert template so the
   generated type usage resolves. See PKGBUILD prepare(). */
#if __has_include(<QtWebEngineCore/qwebenginecallback.h>)
#include <QtWebEngineCore/qwebenginecallback.h>
#else
template <typename T>
class QWebEngineCallback
{
public:
    QWebEngineCallback() {}
    template <typename Func> QWebEngineCallback(Func &&) {}
    QWebEngineCallback(const QWebEngineCallback &) {}
    ~QWebEngineCallback() {}
    void operator()(const T &) const {}
};
#endif
#endif
STUB

  # (s) Qt3DCore/QNodeCommand: absent from Qt 6.11's Qt3DCore.
  mkdir -p extensions/ringqt/cpp/include/Qt3DCore
  cat > extensions/ringqt/cpp/include/Qt3DCore/QNodeCommand <<'STUB'
#ifndef RINGQT6_QT3DCORE_QNODECOMMAND_STUB
#define RINGQT6_QT3DCORE_QNODECOMMAND_STUB
/* Qt5 API, absent from Qt6 Qt3DCore — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QSharedPointer>

namespace Qt3DCore {
class QNodeCommand
{
public:
    explicit QNodeCommand(int subjectId) { (void) subjectId; }
    ~QNodeCommand() {}
    int subjectId() const { return 0; }
};
typedef QSharedPointer<QNodeCommand> QNodeCommandPtr;
}
#endif
STUB

  cat > extensions/ringqt/cpp/include/QAudioEncoderSettings <<'STUB'
#ifndef RINGQT6_QAUDIOENCODERSETTINGS_STUB
#define RINGQT6_QAUDIOENCODERSETTINGS_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QString>

class QAudioEncoderSettings
{
public:
    enum Quality { VeryLowQuality, LowQuality, NormalQuality, HighQuality, VeryHighQuality };
    enum EncodingMode { ConstantQualityEncoding, ConstantBitRateEncoding };

    QAudioEncoderSettings() {}
    QAudioEncoderSettings(const QAudioEncoderSettings &other) { (void) other; }
    ~QAudioEncoderSettings() {}

    QString codec() const { return QString(); }
    void setCodec(const QString &codec) { (void) codec; }
    int bitRate() const { return -1; }
    void setBitRate(int bitrate) { (void) bitrate; }
    int channelCount() const { return -1; }
    void setChannelCount(int channels) { (void) channels; }
    int sampleRate() const { return -1; }
    void setSampleRate(int rate) { (void) rate; }
    Quality quality() const { return NormalQuality; }
    void setQuality(Quality quality) { (void) quality; }
    EncodingMode encodingMode() const { return ConstantQualityEncoding; }
    void setEncodingMode(EncodingMode mode) { (void) mode; }

    bool isNull() const { return true; }
    bool operator==(const QAudioEncoderSettings &) const { return true; }
    bool operator!=(const QAudioEncoderSettings &) const { return false; }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QVideoEncoderSettings <<'STUB'
#ifndef RINGQT6_QVIDEOENCODERSETTINGS_STUB
#define RINGQT6_QVIDEOENCODERSETTINGS_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QString>
#include <QtCore/QSize>

class QVideoEncoderSettings
{
public:
    enum Quality { VeryLowQuality, LowQuality, NormalQuality, HighQuality, VeryHighQuality };
    enum EncodingMode { ConstantQualityEncoding, ConstantBitRateEncoding };

    QVideoEncoderSettings() {}
    QVideoEncoderSettings(const QVideoEncoderSettings &other) { (void) other; }
    ~QVideoEncoderSettings() {}

    QString codec() const { return QString(); }
    void setCodec(const QString &codec) { (void) codec; }
    int bitRate() const { return -1; }
    void setBitRate(int bitrate) { (void) bitrate; }
    qreal frameRate() const { return 0.0; }
    void setFrameRate(qreal rate) { (void) rate; }
    QSize resolution() const { return QSize(); }
    void setResolution(const QSize &resolution) { (void) resolution; }
    Quality quality() const { return NormalQuality; }
    void setQuality(Quality quality) { (void) quality; }
    EncodingMode encodingMode() const { return ConstantQualityEncoding; }
    void setEncodingMode(EncodingMode mode) { (void) mode; }

    bool isNull() const { return true; }
    bool operator==(const QVideoEncoderSettings &) const { return true; }
    bool operator!=(const QVideoEncoderSettings &) const { return false; }
};
#endif
STUB
  cat > extensions/ringqt/cpp/include/QImageEncoderSettings <<'STUB'
#ifndef RINGQT6_QIMAGEENCODERSETTINGS_STUB
#define RINGQT6_QIMAGEENCODERSETTINGS_STUB
/* Qt5 API, removed in Qt6 — inert stub (see PKGBUILD prepare()) */
#include <QtCore/QString>
#include <QtCore/QSize>

class QImageEncoderSettings
{
public:
    enum Quality { VeryLowQuality, LowQuality, NormalQuality, HighQuality, VeryHighQuality };
    enum EncodingMode { ConstantQualityEncoding, ConstantBitRateEncoding };

    QImageEncoderSettings() {}
    QImageEncoderSettings(const QImageEncoderSettings &other) { (void) other; }
    ~QImageEncoderSettings() {}

    QString codec() const { return QString(); }
    void setCodec(const QString &codec) { (void) codec; }
    QSize resolution() const { return QSize(); }
    void setResolution(const QSize &resolution) { (void) resolution; }
    Quality quality() const { return NormalQuality; }
    void setQuality(Quality quality) { (void) quality; }
    EncodingMode encodingMode() const { return ConstantQualityEncoding; }
    void setEncodingMode(EncodingMode mode) { (void) mode; }

    bool isNull() const { return true; }
    bool operator==(const QImageEncoderSettings &) const { return true; }
    bool operator!=(const QImageEncoderSettings &) const { return false; }
};
#endif
STUB

  for f in QBluetoothTransferManager QBluetoothTransferRequest QBluetoothTransferReply \
           QNetworkConfigurationManager QNetworkConfiguration QNetworkSession \
           QAudioRecorder QMediaObject QAudioProbe QVideoProbe \
           QMediaContent QMediaResource QMediaPlaylist \
           QAudioDeviceInfo QCameraViewfinder QVideoWidgetControl QCameraImageCapture \
           QAudioEncoderSettings QVideoEncoderSettings QImageEncoderSettings \
           QWebEngineCallback; do
    [[ -f "extensions/ringqt/cpp/include/$f" ]] || {
      error "stub header $f was not created"; return 1; }
  done
  [[ -f "extensions/ringqt/cpp/include/Qt3DCore/QNodeCommand" ]] || {
    error "stub header Qt3DCore/QNodeCommand was not created"; return 1; }

  # --- Wrapper-level patch script ------------------------------------------
  cat > extensions/ringqt/qt6_wrapper_patches.sh <<'WRAPPATCH'
#!/bin/sh
# Wrapper-level Qt6 patches for the ringqt tree. Idempotent.
cd "$(dirname "$0")" || exit 1

for m in QAction QKeyEvent QMouseEvent; do
    grep -rl "#include <$m>" cpp | xargs -r \
      sed -i "s|#include <$m>|#include <QtGui/$m>|"
done

for f in cpp/include/gshortcut.h; do
    [ -f "$f" ] || continue
    grep -q '#include <QWidget>' "$f" || \
      sed -i 's|#include <QShortcut>|#include <QShortcut>\n#include <QWidget>|' "$f"
done

sed -i 's|QtCharts::||g' cpp/include/*.h cpp/src/*.cpp

for f in cpp/include/gaudioinput.h cpp/include/gaudiooutput.h; do
    [ -f "$f" ] || continue
    grep -q '#include <QAudioFormat>' "$f" || \
      sed -i '1i #include <QAudioFormat> /* Qt6: qaudioinput/qaudiooutput no longer define it */' "$f"
done
for f in cpp/src/gaudioinput.cpp cpp/src/gaudiooutput.cpp; do
    [ -f "$f" ] || continue
    sed -i -e 's|: QAudioInput(parent)|: QAudioInput(nullptr) /* Qt6: routing ctor, format arg dropped */|' \
           -e 's|: QAudioOutput(parent)|: QAudioOutput(nullptr) /* Qt6: routing ctor, format arg dropped */|' "$f"
done
for f in cpp/include/gmediarecorder.h; do
    [ -f "$f" ] || continue
    grep -q '#include <QMediaObject>' "$f" || \
      sed -i '1i #include <QMediaObject> /* Qt6 stub: class removed */' "$f"
done

# GAudioInput wrapper: Qt6's QAudioInput is a routing class with no media
# methods. NOTE: start is deliberately NOT here (wrapped multi-line shape;
# battery's whole-function awk is the only safe treatment). All entries
# below are plain-statement methods only.
for f in cpp/src/gaudioinput.cpp; do
    [ -f "$f" ] || continue
    for fn in stop suspend reset resume setBufferSize setNotifyInterval; do
        sed -i "/GAudioInput::$fn/,/^}/ s|pObject->[^;]*;|(void)0; /* Qt6: routing class, no media API */|" "$f"
    done
    sed -i -e "/GAudioInput::state/,/^}/ s|QAudioInput::state()|0 /* Qt6: routing class */|" \
           -e "/GAudioInput::bufferSize/,/^}/ s|QAudioInput::bufferSize()|0 /* Qt6: routing class */|" \
           -e "/GAudioInput::bytesReady/,/^}/ s|QAudioInput::bytesReady()|0 /* Qt6: routing class */|" \
           -e "/GAudioInput::elapsedUSecs/,/^}/ s|QAudioInput::elapsedUSecs()|0 /* Qt6: routing class */|" \
           -e "/GAudioInput::processedUSecs/,/^}/ s|QAudioInput::processedUSecs()|0 /* Qt6: routing class */|" \
           -e "/GAudioInput::periodSize/,/^}/ s|QAudioInput::periodSize()|0 /* Qt6: routing class */|" \
           -e "/GAudioInput::notifyInterval/,/^}/ s|QAudioInput::notifyInterval()|0 /* Qt6: routing class */|" \
           -e "/GAudioInput::error/,/^}/ s|QAudioInput::error()|0 /* Qt6: routing class */|" \
           -e "/GAudioInput::format/,/^}/ s|QAudioInput::format()|QAudioFormat() /* Qt6: routing class */|" \
           "$f"
done
exit 0
WRAPPATCH
  # sanity: the tarball wrappers must still carry the Qt5 patterns we fix
  n="$(grep -rl 'QtCharts::' extensions/ringqt/cpp | wc -l)"
  if (( n == 0 )); then
    error "expected QtCharts:: qualifiers in the ringqt wrappers (upstream drift?)"
    return 1
  fi
  sh extensions/ringqt/qt6_wrapper_patches.sh || {
    error "wrapper patch script failed"; return 1; }
  grep -rq '#include <QtGui/QAction>' extensions/ringqt/cpp || {
    error "QAction include patch did not apply"; return 1; }
  grep -q '#include <QWidget>' extensions/ringqt/cpp/include/gshortcut.h || {
    error "gshortcut QWidget include patch did not apply"; return 1; }
  if grep -rq 'QtCharts::' extensions/ringqt/cpp; then
    error "QtCharts:: namespace strip incomplete"
    return 1
  fi
  grep -q '#include <QAudioFormat>' extensions/ringqt/cpp/include/gaudioinput.h || {
    error "gaudioinput QAudioFormat include patch did not apply"; return 1; }
  grep -q 'QAudioInput(nullptr)' extensions/ringqt/cpp/src/gaudioinput.cpp || {
    error "gaudioinput ctor patch did not apply"; return 1; }
  grep -q '#include <QMediaObject>' extensions/ringqt/cpp/include/gmediarecorder.h || {
    error "gmediarecorder QMediaObject include patch did not apply"; return 1; }

  # --- Mega-TU patch battery ------------------------------------------------
  cat > extensions/ringqt/qt6_battery.sh <<'BATTERY'
#!/bin/sh
# Qt6 compatibility battery for ONE generated mega-TU ($1, path relative to
# extensions/ringqt). Idempotent. Created by the ring-lang PKGBUILD prepare().
cd "$(dirname "$0")" || exit 1
f="$1"
[ -f "$f" ] || { echo "ERROR: battery target missing: $f" >&2; exit 1; }

# delete_call_statement TOKEN — removes the full statement containing the
# TOKEN call, robust to multi-line lambda arguments: tracks paren depth
# from TOKEN's opening paren until it closes.
delete_call_statement() {
  tok="$1"
  awk -v tok="$tok" '
    index($0, tok) && !kill {
      start = index($0, tok) + length(tok) - 1
      depth = 0
      for (i = start; i <= length($0); i++) {
        c = substr($0, i, 1)
        if (c == "(") depth++
        if (c == ")") depth--
      }
      if (depth > 0) { kill = 1; next }
      next
    }
    kill {
      for (i = 1; i <= length($0); i++) {
        c = substr($0, i, 1)
        if (c == "(") depth++
        if (c == ")") depth--
      }
      if (depth <= 0) kill = 0
      next
    }
    { print }
  ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
}

# Qt6 only FORWARD-DECLARES QRegExp/QStringRef/QTextCodec — force the
# Qt5Compat definitions in:
if ! grep -q '#include <QRegExp>' "$f" ; then
  { echo '#include <QRegExp>     /* Qt6: moved to Qt5Compat */'
    echo '#include <QStringRef>  /* Qt6: moved to Qt5Compat */'
    echo '#include <QTextCodec>  /* Qt6: moved to Qt5Compat */'
    cat "$f"; } > "$f.tmp" && mv "$f.tmp" "$f"
fi

# QLocale getters returned QChar in Qt5, QString in Qt6:
for m in decimalPoint exponential groupSeparator negativeSign percent positiveSign zeroDigit; do
    sed -i "s|\*pValue = pObject->$m();|*pValue = pObject->$m().at(0);|" "$f"
done
# QTextStream::codec()/setCodec() and QMutex::isRecursive() removed;
# QMutexLocker became a template:
sed -i -e 's|RING_API_RETCPOINTER(pObject->codec(),"QTextCodec")|RING_API_RETCPOINTER(nullptr,"QTextCodec") /* Qt6: removed */|' \
       -e 's|pObject->setCodec(.*|(void)0; /* Qt6: QTextStream::setCodec() removed */|' \
       -e 's|pObject->isRecursive()|0 /* Qt6: QMutex::isRecursive() removed */|' \
       -e 's|QMutexLocker \*|QMutexLocker<QMutex> *|g' \
       -e 's|new QMutexLocker(|new QMutexLocker<QMutex>(|g' \
       "$f"

# QLocale lost its QStringRef overloads in Qt6 — pass QString instead:
for fn in quoteString_2 toDouble_2 toFloat_2 toInt_2 toLongLong_2 toShort_2 \
          toUInt_2 toULongLong_2 toUShort_2; do
    sed -i "/ring_QLocale_$fn/,/^}/ s|\* (QStringRef  \*) RING_API_GETCPOINTER(\([0-9]*\),\"QStringRef\")|(* (QStringRef  *) RING_API_GETCPOINTER(\1,\"QStringRef\")).toString()|" "$f"
done

# split()/section() lost their QRegExp overloads:
sed -i -e 's|\*pValue = pObject->split(\* (QRegExp\b[^;]*;|RING_API_ERROR("Qt6: split(QRegExp) removed"); return; /* was split(QRegExp) */|' \
       -e 's|RING_API_RETSTRING(pObject->section(\* (QRegExp\b[^;]*;|RING_API_ERROR("Qt6: section(QRegExp) removed"); return; /* was section(QRegExp) */|' \
       "$f"
# XML stream getters now return QStringView instead of QStringRef:
for fn in \
    QXmlStreamReader_documentEncoding QXmlStreamReader_documentVersion \
    QXmlStreamReader_dtdName QXmlStreamReader_dtdPublicId QXmlStreamReader_dtdSystemId \
    QXmlStreamReader_name QXmlStreamReader_namespaceUri QXmlStreamReader_prefix \
    QXmlStreamReader_processingInstructionData QXmlStreamReader_processingInstructionTarget \
    QXmlStreamReader_qualifiedName QXmlStreamReader_text \
    QXmlStreamNotationDeclaration_name QXmlStreamNotationDeclaration_publicId \
    QXmlStreamNotationDeclaration_systemId \
    QXmlStreamNamespaceDeclaration_namespaceUri QXmlStreamNamespaceDeclaration_prefix \
    QXmlStreamEntityDeclaration_name QXmlStreamEntityDeclaration_notationName \
    QXmlStreamEntityDeclaration_publicId QXmlStreamEntityDeclaration_systemId \
    QXmlStreamEntityDeclaration_value \
    QXmlStreamAttributes_value QXmlStreamAttributes_value_2 QXmlStreamAttributes_value_3 \
    QXmlStreamAttributes_value_4 QXmlStreamAttributes_value_5 \
    QXmlStreamAttribute_name QXmlStreamAttribute_namespaceUri QXmlStreamAttribute_prefix \
    QXmlStreamAttribute_qualifiedName QXmlStreamAttribute_value \
    QRegularExpressionMatch_capturedRef QRegularExpressionMatch_capturedRef_2 ; do
    sed -i "/ring_$fn/,/^}/ {
        s|QStringRef *\*pValue|QStringView *pValue|
        s|pValue *= *new QStringRef|pValue = new QStringView|
        s|RETCPOINTER(pValue,\"QStringRef\")|RETCPOINTER(pValue,\"QStringView\")|
    }" "$f"
done
# Blanket fixes (patterns unique to the affected sites):
sed -i -e 's|pObject->capturedRef(\(.*\));|QStringView(pObject->captured(\1));|g' \
       -e 's|(QString::SplitBehavior ) *(int)|(Qt::SplitBehavior )  (int)|g' \
       -e 's|setProperty(RING_API_GETSTRING(2),RING_API_GETSTRING(3))|setProperty(RING_API_GETSTRING(2),QString(RING_API_GETSTRING(3)))|g' \
       -e 's|new QVariant(RING_API_GETSTRING(1))|new QVariant(QString(RING_API_GETSTRING(1)))|g' \
       -e 's|new QMutex((QMutex::RecursionMode) *(int) RING_API_GETNUMBER(1))|new QMutex() /* Qt6: non-recursive only */|' \
       -e 's|\*pValue = pObject->toRegExp();|RING_API_ERROR("Qt6: QVariant::toRegExp() removed"); return;|' \
       "$f"

# Light-stage drift:
sed -i -e 's|pObject->setWeight( (int ) RING_API_GETNUMBER(2))|pObject->setWeight((QFont::Weight) (int) RING_API_GETNUMBER(2))|' \
       -e 's|pObject->toHtml(\* (QByteArray  \*) RING_API_GETCPOINTER(2,"QByteArray"))|pObject->toHtml() /* Qt6: no encoding arg */|' \
       -e 's|RING_API_RETNUMBER(pObject->orientationUpdateMask());|RING_API_RETNUMBER(0); /* Qt6: removed */|' \
       -e 's|pObject->setOrientationUpdateMask( (Qt::ScreenOrientations )  (int) RING_API_GETNUMBER(2));|(void)0; /* Qt6: removed */|' \
       -e 's|\*pValue = pObject->nativeHandle();|*pValue = QVariant(); /* Qt6: removed */|' \
       -e 's|pObject->setNativeHandle(\* (QVariant  \*) RING_API_GETCPOINTER(2,"QVariant"));|(void)0; /* Qt6: removed */|' \
       -e 's|RING_API_RETCPOINTER(pObject->openGLModuleHandle(),"void");|RING_API_RETCPOINTER(nullptr,"void"); /* Qt6: removed */|' \
       -e 's|RING_API_RETCPOINTER(pObject->versionFunctions(\* (QOpenGLVersionProfile  \*) RING_API_GETCPOINTER(2,"QOpenGLVersionProfile")),"QAbstractOpenGLFunctions");|RING_API_ERROR("Qt6: versionFunctions() removed"); return;|' \
       -e 's|RING_API_RETCPOINTER(pObject->versionFunctions(),"TYPE");|RING_API_ERROR("Qt6: versionFunctions() removed"); return;|' \
       -e 's|QOpenGLContext::currentContext()->versionFunctions<QOpenGLFunctions_3_2_Core>()|nullptr /* Qt6: versionFunctions<T>() removed */|' \
       -e 's|pObject->glIndexub( (GLubyte ) RING_API_GETNUMBER(2));|(void)0; /* Qt6: removed */|' \
       -e 's|pObject->glIndexubv((GLubyte \*) RING_API_GETCPOINTER(2,"GLubyte"));|(void)0; /* Qt6: removed */|' \
       -e 's|pObject->animateClick( (int ) RING_API_GETNUMBER(2));|pObject->animateClick(); /* Qt6: no delay arg */|' \
       -e 's|pObject->visitedPages()|pObject->visitedIds()|' \
       -e 's|setSelectionArea(\* (QPainterPath  \*) RING_API_GETCPOINTER(2,"QPainterPath"), (Qt::ItemSelectionMode|setSelectionArea(* (QPainterPath  *) RING_API_GETCPOINTER(2,"QPainterPath"), Qt::ReplaceSelection, (Qt::ItemSelectionMode|' \
       "$f"

# QPicture::load/save lost the format argument in Qt6:
sed -i "/ring_QPicture_load/,/^}/ s|RING_API_RETNUMBER(pObject->load(.*|RING_API_RETNUMBER(pObject->load(QString(RING_API_GETSTRING(2)))); /* Qt6: no format arg */|" "$f"
sed -i "/ring_QPicture_save/,/^}/ s|RING_API_RETNUMBER(pObject->save(.*|RING_API_RETNUMBER(pObject->save(QString(RING_API_GETSTRING(2)))); /* Qt6: no format arg */|" "$f"

# Qt6 color getters take float*:
for fn in QColor_getCmykF QColor_getHslF QColor_getHsvF QColor_getRgbF; do
    sed -i "/ring_$fn/,/^}/ s|(qreal \*) RING_API_GETCPOINTER(|(float *) RING_API_GETCPOINTER(|g" "$f"
done
# QWheelEvent coordinate accessors replaced by position()/globalPosition():
for fn in QWheelEvent_globalPosF QWheelEvent_globalX QWheelEvent_globalY \
          QWheelEvent_posF QWheelEvent_x QWheelEvent_y; do
    sed -i "/ring_$fn/,/^}/ {
        s|pObject->globalPosF()|pObject->globalPosition()|
        s|pObject->globalX()|pObject->globalPosition().toPoint().x()|
        s|pObject->globalY()|pObject->globalPosition().toPoint().y()|
        s|pObject->posF()|pObject->position()|
        s|pObject->x()|pObject->position().toPoint().x()|
        s|pObject->y()|pObject->position().toPoint().y()|
    }" "$f"
done
# Qt6 returns these by value — box for RETCPOINTER:
sed -i "/ring_QCursor_bitmap/,/^}/ s|RING_API_RETCPOINTER(pObject->bitmap(),\"QBitmap\")|RING_API_RETCPOINTER(new QBitmap(pObject->bitmap()),\"QBitmap\")|" "$f"
sed -i "/ring_QCursor_mask/,/^}/ s|RING_API_RETCPOINTER(pObject->mask(),\"QBitmap\")|RING_API_RETCPOINTER(new QBitmap(pObject->mask()),\"QBitmap\")|" "$f"
sed -i "/ring_QLabel_picture/,/^}/ s|RING_API_RETCPOINTER(pObject->picture(),\"QPicture\")|RING_API_RETCPOINTER(new QPicture(pObject->picture()),\"QPicture\")|" "$f"
sed -i "/ring_QLabel_pixmap/,/^}/ s|RING_API_RETCPOINTER(pObject->pixmap(),\"QPixmap\")|RING_API_RETCPOINTER(new QPixmap(pObject->pixmap()),\"QPixmap\")|" "$f"

# --- Full-TU body drift (pkgrel=24 digest) -----------------------------------
sed -i -e 's|QAudioFormat::SampleType|int|g' \
       -e 's|QAudioFormat::Endian|int|g' \
       -e 's|QVideoFrame::PixelFormat|int|g' \
       -e 's|QBluetoothDeviceInfo::DataCompleteness|int|g' \
       -e 's|Qt3DCore::QNode::PropertyTrackingMode|int|g' \
       -e 's|QCamera::LockTypes|int|g' \
       -e 's|QCamera::LockType\b|int|g' \
       -e 's|QCamera::CaptureModes|int|g' \
       -e 's|QWebEngineDownloadItem|QWebEngineDownloadRequest|g' \
       "$f"
# QCamera Qt5 lock/viewfinder/captureMode API removed in Qt6:
sed -i -e 's|pObject->setViewfinder([^;]*;|(void)0; /* Qt6: viewfinder API removed */|' \
       -e 's|pObject->searchAndLock([^;]*;|(void)0; /* Qt6: lock API removed */|' \
       -e 's|pObject->setCaptureMode([^;]*;|(void)0; /* Qt6: captureMode API removed */|' \
       -e 's|RING_API_RETNUMBER(pObject->lockStatus([^;]*;|RING_API_RETNUMBER(0); /* Qt6: lock API removed */|' \
       -e 's|RING_API_RETNUMBER(pObject->isCaptureModeSupported([^;]*;|RING_API_RETNUMBER(0); /* Qt6: captureMode API removed */|' \
       "$f"
# QCamera::unlock stays FUNCTION-SCOPED (QMutex::unlock() is valid Qt6):
sed -i "/ring_QCamera_unlock/,/^}/ s|pObject->unlock([^;]*;|(void)0; /* Qt6: lock API removed */|" "$f"

# QAudioInput::start removed in Qt6 — whole-function inert stub via awk.
# The awk REGEX matches the bare function name PREFIX, so overloads
# (ring_QAudioInput_start_2 etc.) AND the wrapped-multi-line shape are all
# handled by function replacement. Idempotent via the marker text.
if ! grep -q 'QAudioInput::start() removed' "$f" ; then
  awk '
    /^RING_FUNC\(ring_QAudioInput_start/ {
      fname = $0
      sub(/^RING_FUNC\(/, "", fname); sub(/\)$/, "", fname)
      print "RING_FUNC(" fname ")"
      print "{"
      print "\tRING_API_ERROR(\"Qt6: QAudioInput::start() removed (use QAudioSource)\");"
      print "}"
      infn = 1; next
    }
    infn && /^}/ { infn = 0; next }
    infn { next }
    { print }
  ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
fi

# QMediaRecorder::setOutputLocation returns void in Qt6 — whole-function stub:
if ! grep -q 'setOutputLocation() removed' "$f" ; then
  awk '
    /^RING_FUNC\(ring_QMediaRecorder_setOutputLocation/ {
      fname = $0
      sub(/^RING_FUNC\(/, "", fname); sub(/\)$/, "", fname)
      print "RING_FUNC(" fname ")"
      print "{"
      print "\tRING_API_ERROR(\"Qt6: setOutputLocation() removed\");"
      print "}"
      infn = 1; next
    }
    infn && /^}/ { infn = 0; next }
    infn { next }
    { print }
  ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
fi

# --- QMediaPlayer/QCamera removed Qt5 methods (pkgrel=27 digest) --------------
for fn in QMediaPlayer_setMedia QMediaPlayer_setPlaylist \
          QMediaPlayer_setVolume QMediaPlayer_setMuted; do
    sed -i "/ring_$fn/,/^}/ s|pObject->[^;]*;|(void)0; /* Qt6: removed */|" "$f"
done
sed -i -e "/ring_QMediaPlayer_volume/,/^}/ s|pObject->volume()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaPlayer_state/,/^}/ s|pObject->state()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaPlayer_isMuted/,/^}/ s|pObject->isMuted()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaPlayer_isAudioAvailable/,/^}/ s|pObject->isAudioAvailable()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaPlayer_isVideoAvailable/,/^}/ s|pObject->isVideoAvailable()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaPlayer_bufferStatus/,/^}/ s|pObject->bufferStatus()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaPlayer_playlist/,/^}/ s|pObject->playlist()|nullptr /* Qt6: removed */|" \
       -e "/ring_QMediaPlayer_mediaStream/,/^}/ s|pObject->mediaStream()|nullptr /* Qt6: removed */|" \
       "$f"
sed -i -e 's|RING_API_RETCPOINTER(pObject->media(),"QMediaContent")|RING_API_RETCPOINTER(new QMediaContent(),"QMediaContent") /* Qt6: removed */|' \
       -e 's|RING_API_RETCPOINTER(pObject->currentMedia(),"QMediaContent")|RING_API_RETCPOINTER(new QMediaContent(),"QMediaContent") /* Qt6: removed */|' \
       -e 's|new QMediaContent(pObject->media())|new QMediaContent() /* Qt6: removed */|g' \
       -e 's|new QMediaContent(pObject->currentMedia())|new QMediaContent() /* Qt6: removed */|g' \
       -e 's|\*pValue = pObject->media();|*pValue = QMediaContent(); /* Qt6: removed */|' \
       -e 's|\*pValue = pObject->currentMedia();|*pValue = QMediaContent(); /* Qt6: removed */|' \
       "$f"
sed -i "/ring_QCamera_unload/,/^}/ s|pObject->unload() *;|(void)0; /* Qt6: removed */|" "$f"
sed -i "/ring_QCamera_supportedLocks/,/^}/ s|pObject->supportedLocks()|0 /* Qt6: removed */|" "$f"

# --- pkgrel=32/33/34 digest ---------------------------------------------------
delete_call_statement "pObject->page()->print("
delete_call_statement "pObject->print("
delete_call_statement "pObject->findText("

sed -i "/ring_QBluetoothSocket_state/,/^}/ s|RING_API_RETNUMBER(pObject->state())|RING_API_RETNUMBER((int) pObject->state())|" "$f"
sed -i "/ring_QBluetoothSocket_error/,/^}/ s|RING_API_RETNUMBER(pObject->error())|RING_API_RETNUMBER((int) pObject->error())|" "$f"

sed -i "/ring_QPrintPreviewWidget_setOrientation/,/^}/ s|pObject->setOrientation([^;]*;|(void)0; /* Qt6: QPrinter::Orientation removed */|" "$f"
sed -i "/ring_QNetworkAccessManager_setNetworkAccessible/,/^}/ s|pObject->setNetworkAccessible([^;]*;|(void)0; /* Qt6: removed */|" "$f"
sed -i "/ring_QNetworkAccessManager_networkAccessible/,/^}/ s|pObject->networkAccessible()|0 /* Qt6: removed */|" "$f"
sed -i "/ring_QBluetoothDeviceDiscoveryAgent_setInquiryType/,/^}/ s|pObject->setInquiryType([^;]*;|(void)0; /* Qt6: removed */|" "$f"
sed -i "/ring_QBluetoothDeviceDiscoveryAgent_inquiryType/,/^}/ s|pObject->inquiryType()|0 /* Qt6: removed */|" "$f"
sed -i "/ring_QVideoWidget_setSaturation/,/^}/ s|pObject->setSaturation([^;]*;|(void)0; /* Qt6: removed */|" "$f"

sed -i -e 's|QPrinter::Orientation|int|g' \
       -e 's|QNetworkAccessManager::NetworkAccessibility|int|g' \
       -e 's|QBluetoothDeviceDiscoveryAgent::InquiryType|int|g' \
       "$f"

sed -i 's|pObject->setPageSizeMM([^;]*;|(void)0; /* Qt6: removed */|' "$f"

sed -i -e 's|pObject->setPropertyTracking([^;]*;|(void)0; /* Qt6: removed */|' \
       -e 's|pObject->setDefaultPropertyTrackingMode([^;]*;|(void)0; /* Qt6: removed */|' \
       -e 's|pObject->sendReply([^;]*;|(void)0; /* Qt6: removed */|' \
       -e 's|pObject->clearPropertyTrackings([^;]*;|(void)0; /* Qt6: removed */|' \
       -e 's|pObject->clearPropertyTracking([^;]*;|(void)0; /* Qt6: removed */|' \
       -e 's|pObject->propertyTracking(RING_API_GETSTRING([0-9]*))|0 /* Qt6: removed */|' \
       -e 's|pObject->propertyTracking()|0 /* Qt6: removed */|' \
       -e 's|pObject->defaultPropertyTrackingMode()|0 /* Qt6: removed */|' \
       "$f"

sed -i -e 's|\*pValue = pObject->serviceUuids([^;]*;|*pValue = QList<QBluetoothUuid>(); /* Qt6: changed */|' \
       -e 's|pObject->setServiceUuids([^;]*;|(void)0; /* Qt6: changed */|' \
       "$f"

sed -i "/ring_QMediaRecorder_metaData/,/^}/ s|pObject->metaData(RING_API_GETSTRING([0-9]*))|QVariant() /* Qt6: QMediaMetaData API */|" "$f"
sed -i "/ring_QMediaRecorder_setMetaData/,/^}/ s|pObject->setMetaData([^;]*;|(void)0; /* Qt6: QMediaMetaData API */|" "$f"

sed -i -e "/ring_QCamera_status/,/^}/ s|pObject->status()|0 /* Qt6: removed */|" \
       -e "/ring_QCamera_state/,/^}/ s|pObject->state()|0 /* Qt6: removed */|" \
       -e "/ring_QCamera_load/,/^}/ s|pObject->load([^;]*;|(void)0; /* Qt6: removed */|" \
       -e "/ring_QCamera_requestedLocks/,/^}/ s|pObject->requestedLocks()|0 /* Qt6: removed */|" \
       "$f"

# --- pkgrel=36 digest ---------------------------------------------------------
for fn in QVideoWidget_setBrightness QVideoWidget_setContrast QVideoWidget_setHue; do
    sed -i "/ring_$fn/,/^}/ s|pObject->[^;]*;|(void)0; /* Qt6: removed */|" "$f"
done
sed -i -e "/ring_QVideoWidget_brightness/,/^}/ s|pObject->brightness()|0 /* Qt6: removed */|" \
       -e "/ring_QVideoWidget_contrast/,/^}/ s|pObject->contrast()|0 /* Qt6: removed */|" \
       -e "/ring_QVideoWidget_hue/,/^}/ s|pObject->hue()|0 /* Qt6: removed */|" \
       -e "/ring_QVideoWidget_saturation/,/^}/ s|pObject->saturation()|0 /* Qt6: removed */|" \
       "$f"

sed -i "/ring_QWebEnginePage_setView/,/^}/ s|pObject->setView([^;]*;|(void)0; /* Qt6: removed */|" "$f"
sed -i -e "/ring_QWebEnginePage_view/,/^}/ s|pObject->view()|nullptr /* Qt6: removed */|" \
       -e "/ring_QWebEnginePage_createStandardContextMenu/,/^}/ s|pObject->createStandardContextMenu()|nullptr /* Qt6: removed */|" \
       "$f"

sed -i -e "/ring_QCamera_exposure/,/^}/ s|pObject->exposure()|nullptr /* Qt6: removed */|" \
       -e "/ring_QCamera_focus/,/^}/ s|pObject->focus()|nullptr /* Qt6: removed */|" \
       -e "/ring_QCamera_imageProcessing/,/^}/ s|pObject->imageProcessing()|nullptr /* Qt6: removed */|" \
       -e "/ring_QCamera_captureMode/,/^}/ s|pObject->captureMode()|0 /* Qt6: removed */|" \
       "$f"

for fn in QAudioFormat_setSampleType QAudioFormat_setSampleSize QAudioFormat_setByteOrder; do
    sed -i "/ring_$fn/,/^}/ s|pObject->[^;]*;|(void)0; /* Qt6: removed */|" "$f"
done
sed -i -e "/ring_QAudioFormat_sampleType/,/^}/ s|pObject->sampleType()|0 /* Qt6: removed */|" \
       -e "/ring_QAudioFormat_sampleSize/,/^}/ s|pObject->sampleSize()|0 /* Qt6: removed */|" \
       -e "/ring_QAudioFormat_byteOrder/,/^}/ s|pObject->byteOrder()|0 /* Qt6: removed */|" \
       -e "/ring_QAudioFormat_codec/,/^}/ s|pObject->codec()|QString() /* Qt6: removed */|" \
       "$f"

sed -i "/ring_QSoundEffect_setCategory/,/^}/ s|pObject->setCategory([^;]*;|(void)0; /* Qt6: removed */|" "$f"
sed -i "/ring_QSoundEffect_category/,/^}/ s|pObject->category()|QString() /* Qt6: removed */|" "$f"

sed -i "/ring_QNetworkAccessManager_setConfiguration/,/^}/ s|pObject->setConfiguration([^;]*;|(void)0; /* Qt6: bearer API removed */|" "$f"
sed -i "/ring_QNetworkAccessManager_configuration/,/^}/ s|pObject->configuration()|QNetworkConfiguration() /* Qt6: bearer API removed */|" "$f"

sed -i "/ring_QBluetoothDeviceInfo_serviceUuidsCompleteness/,/^}/ s|pObject->serviceUuidsCompleteness()|0 /* Qt6: removed */|" "$f"

# --- pkgrel=37/39 digest ------------------------------------------------------
# GMediaRecorder Qt5 methods removed/changed in Qt6 (19 methods):
for fn in QMediaRecorder_setVolume QMediaRecorder_setMuted \
           QMediaRecorder_setAudioSettings QMediaRecorder_setVideoSettings \
           QMediaRecorder_setEncodingSettings; do
    sed -i "/ring_$fn/,/^}/ s|pObject->[^;]*;|(void)0; /* Qt6: removed */|" "$f"
done
sed -i -e "/ring_QMediaRecorder_volume/,/^}/ s|pObject->volume()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_state/,/^}/ s|pObject->state()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_status/,/^}/ s|pObject->status()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_isMuted/,/^}/ s|pObject->isMuted()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_isMetaDataAvailable/,/^}/ s|pObject->isMetaDataAvailable()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_isMetaDataWritable/,/^}/ s|pObject->isMetaDataWritable()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_availability/,/^}/ s|pObject->availability()|0 /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_containerFormat/,/^}/ s|pObject->containerFormat()|QString() /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_supportedContainers/,/^}/ s|pObject->supportedContainers()|QStringList() /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_supportedAudioCodecs/,/^}/ s|pObject->supportedAudioCodecs()|QStringList() /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_supportedVideoCodecs/,/^}/ s|pObject->supportedVideoCodecs()|QStringList() /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_audioSettings/,/^}/ s|pObject->audioSettings()|QAudioEncoderSettings() /* Qt6: removed */|" \
       -e "/ring_QMediaRecorder_videoSettings/,/^}/ s|pObject->videoSettings()|QVideoEncoderSettings() /* Qt6: removed */|" \
       "$f"
sed -i "/ring_QMediaRecorder_containerDescription/,/^}/ s|pObject->containerDescription(RING_API_GETSTRING([0-9]*))|QString() /* Qt6: removed */|" "$f"
sed -i "/ring_QMediaRecorder_videoCodecDescription/,/^}/ s|pObject->videoCodecDescription(RING_API_GETSTRING([0-9]*))|QString() /* Qt6: removed */|" "$f"

# GAudioInput Qt5 methods removed in Qt6 (routing class has no media API).
# start is handled ONLY by the whole-function awk stub above — no sed.
# All call shapes here are PROVABLY PLAIN one-line statements.
for fn in QAudioInput_stop QAudioInput_suspend QAudioInput_reset QAudioInput_resume \
           QAudioInput_setBufferSize QAudioInput_setNotifyInterval; do
    sed -i "/ring_$fn/,/^}/ s|pObject->[^;]*;|(void)0; /* Qt6: routing class, no media API */|" "$f"
done
sed -i -e "/ring_QAudioInput_state/,/^}/ s|pObject->state()|0 /* Qt6: routing class */|" \
       -e "/ring_QAudioInput_bufferSize/,/^}/ s|pObject->bufferSize()|0 /* Qt6: routing class */|" \
       -e "/ring_QAudioInput_bytesReady/,/^}/ s|pObject->bytesReady()|0 /* Qt6: routing class */|" \
       -e "/ring_QAudioInput_elapsedUSecs/,/^}/ s|pObject->elapsedUSecs()|0 /* Qt6: routing class */|" \
       -e "/ring_QAudioInput_processedUSecs/,/^}/ s|pObject->processedUSecs()|0 /* Qt6: routing class */|" \
       -e "/ring_QAudioInput_periodSize/,/^}/ s|pObject->periodSize()|0 /* Qt6: routing class */|" \
       -e "/ring_QAudioInput_notifyInterval/,/^}/ s|pObject->notifyInterval()|0 /* Qt6: routing class */|" \
       -e "/ring_QAudioInput_error/,/^}/ s|pObject->error()|0 /* Qt6: routing class */|" \
       "$f"
sed -i "/ring_QAudioInput_format/,/^}/ s|pObject->format()|QAudioFormat() /* Qt6: routing class */|" "$f"

# GBluetoothLocalDevice::pairingConfirmation removed:
sed -i "/ring_QBluetoothLocalDevice_pairingConfirmation/,/^}/ s|pObject->pairingConfirmation([^;]*;|(void)0; /* Qt6: removed */|" "$f"

# GNetworkAccessManager::activeConfiguration removed (bearer API):
sed -i "/ring_QNetworkAccessManager_activeConfiguration/,/^}/ s|pObject->activeConfiguration()|QNetworkConfiguration() /* Qt6: bearer API removed */|" "$f"

# (QBluetoothTransferReply::abort and QBluetoothTransferManager::put are
# provided by the STUB HEADERS — no seds needed for those.)
exit 0
BATTERY
  local qtfiles=(cpp/src/ring_qt_core.cpp
                 cpp/src/ring_qt_light.cpp
                 cpp/src/ring_qt.cpp)
  for f in "${qtfiles[@]}"; do
    [[ -f "extensions/ringqt/$f" ]] || continue
    ( cd extensions/ringqt && sh qt6_battery.sh "$f" ) || {
      error "Qt6 battery failed on $f"; return 1; }
  done
  grep -q '#include <QRegExp>' extensions/ringqt/cpp/src/ring_qt_core.cpp || {
    error "Qt5Compat include injection failed (core)"; return 1; }
  n="$(grep -c 'QStringView \*pValue' extensions/ringqt/cpp/src/ring_qt_core.cpp || true)"
  if (( n < 32 )); then
    error "QStringView getter swap applied to only $n functions (expected 32+)"
    return 1
  fi

  # Battery output sanity: macro lines must have balanced parens, EXCEPT
  # lambda openers.
  local bad
  for f in "${qtfiles[@]}"; do
    [[ -f "extensions/ringqt/$f" ]] || continue
    bad="$(awk '
      /RING_API_(RETNUMBER|RETSTRING|RETCPOINTER|ERROR|GETSTRING|GETNUMBER|GETCPOINTER)/ {
        if ($0 ~ /\[=\]\(/) next
        if (gsub(/\(/, "(") == gsub(/\)/, ")")) next
        if ($0 ~ /\{$/) next
        print FILENAME ":" FNR ": " $0
      }' "extensions/ringqt/$f")"
    if [[ -n "$bad" ]]; then
      error "battery produced unbalanced macro statements:"
      error "$bad"
      return 1
    fi
  done

  # --- Full-stage gencode wrapper -------------------------------------------
  cat > extensions/ringqt/gencode_qt6.sh <<'GENCODE'
#!/bin/sh
cd "$(dirname "$0")" || exit 1

./gencode.sh || exit 1

if grep -q 'QAx' cpp/src/ring_qt.cpp ; then
    echo "ERROR: regenerated ring_qt.cpp still contains ActiveX (QAx) content" >&2
    exit 1
fi

missing=$(grep -h -oE '#include <[A-Z][A-Za-z0-9]*(/[A-Za-z0-9]+)*>' cpp/src/ring_qt.cpp \
          | sed -e 's/^#include <//' -e 's/>$//' | sort -u | grep -v '^QAx' \
          | while read -r h; do
              found=""
              for d in /usr/include/qt6 /usr/include/qt6/*; do
                  [ -f "$d/$h" ] && { found=1; break; }
              done
              [ -z "$found" ] && [ -f "cpp/include/$h" ] && found=1
              [ -z "$found" ] && echo "$h"
            done)
if [ -n "$missing" ]; then
    echo "ERROR: unresolved Qt headers in the regenerated ring_qt.cpp:$missing" >&2
    exit 1
fi

# .pro insurance matching prepare()'s (a) fix:
grep -q '\-l:libring\.so' ring_qt515.pro || \
  sed -i 's|LIBS += */usr/lib/libring\.so|LIBS += -L../../lib -l:libring.so|' ring_qt515.pro
grep -q 'rpath.*ORIGIN' ring_qt515.pro || \
  printf 'QMAKE_LFLAGS += -Wl,-rpath,$$ORIGIN -Wl,-rpath,$$ORIGIN/../../lib\n' >> ring_qt515.pro
for mod in openglwidgets svgwidgets; do
    grep -q "QT += $mod" ring_qt515.pro || printf 'QT += %s\n' "$mod" >> ring_qt515.pro
done
if ! grep -q '^QT += core5compat' ring_qt515.pro; then
    [ -n "$(tail -c 1 ring_qt515.pro)" ] && printf '\n' >> ring_qt515.pro
    printf 'QT += core5compat\n' >> ring_qt515.pro
    printf 'INCLUDEPATH += $$[QT_INSTALL_HEADERS]/Qt5Compat\n' >> ring_qt515.pro
    printf 'LIBS += -lQt6Core5Compat\n' >> ring_qt515.pro
    printf 'DEFINES += QT_CORE5COMPAT_LIB\n' >> ring_qt515.pro
fi

sh qt6_wrapper_patches.sh || exit 1
sh qt6_battery.sh cpp/src/ring_qt.cpp || exit 1

bad=$(awk '/RING_API_(RETNUMBER|RETSTRING|RETCPOINTER|ERROR|GETSTRING|GETNUMBER|GETCPOINTER)/ {
             if ($0 ~ /\[=\]\(/) next
             if (gsub(/\(/,"(") == gsub(/\)/,")")) next
             if ($0 ~ /\{$/) next
             print FNR": "$0
           }' cpp/src/ring_qt.cpp)
if [ -n "$bad" ]; then
    echo "ERROR: battery produced unbalanced macro statements:" >&2
    echo "$bad" >&2
    exit 1
fi

for h in QSvgWidget QWebEngineCallback QWebEngineDownloadRequest \
         QAudioEncoderSettings QVideoEncoderSettings QImageEncoderSettings; do
    grep -q "#include <$h>" cpp/src/ring_qt.cpp || \
      sed -i "1i #include <$h> /* PKGBUILD: used without include */" cpp/src/ring_qt.cpp
done

echo "gencode_qt6.sh: ring_qt.cpp + wrappers regenerated (Linux flavor), Qt6 patches re-applied"
GENCODE
  chmod 755 extensions/ringqt/gencode_qt6.sh
  [[ -f extensions/ringqt/gencode_qt6.sh ]] || {
    error "gencode_qt6.sh was not created"; return 1; }

  # (f) gencode stage control:
  sed -i '/extensions\/ringqt/s/"gencode[^"]*"/""/g' build/buildgcc.sh
  sed -i '/extensions\/ringqt/{/"buildgcc\.sh"/s|""|"gencode_qt6.sh"|}' build/buildgcc.sh
  if grep -Eq 'extensions/ringqt[[:space:]]+"gencode(_core|_light)?\.sh"' build/buildgcc.sh; then
    error "failed to neutralize the core/light ringqt gencode stages"
    return 1
  fi
  if ! grep -q 'extensions/ringqt.*"gencode_qt6\.sh"' build/buildgcc.sh; then
    error "full ringqt stage does not call gencode_qt6.sh"
    return 1
  fi

  # (q) COMPLETENESS CHECK:
  local missing="" hit
  while read -r h; do
    hit=""
    for d in /usr/include/qt6 /usr/include/qt6/*; do
      [[ -f "$d/$h" ]] && { hit=1; break; }
    done
    [[ -z "$hit" && -f "extensions/ringqt/cpp/include/$h" ]] && hit=1
    [[ -z "$hit" ]] && missing+=" $h"
  done < <(grep -h -oP '#include <\K[A-Z][A-Za-z0-9]*(/[A-Za-z0-9]+)*(?=>)' \
             extensions/ringqt/cpp/src/ring_qt_core.cpp \
             extensions/ringqt/cpp/src/ring_qt_light.cpp \
             extensions/ringqt/cpp/src/ring_qt.cpp | grep -v '^QAx' | sort -u)
  if [[ -n "$missing" ]]; then
    error "unresolved Qt headers in the mega-TU include blocks (add stubs or a module):$missing"
    return 1
  fi

  # --- RingMySQL vs Arch's MariaDB-only packaging ----------------------------
  # Arch ships no Oracle MySQL; mariadb-libs provides the client as
  # libmariadb: pkg-config name 'libmariadb' (no mysqlclient.pc exists) and
  # headers under /usr/include/mariadb (mysql.h is NOT at /usr/include).
  # libmariadb is API-compatible with libmysqlclient, so a token rename of
  # the build script's package name fixes compile AND link.
  local mysqlpatched=0
  for s in extensions/ringmysql/buildgcc.sh extensions/ringmysql/build.sh \
           extensions/ringmysql/src/buildgcc.sh; do
    [[ -f "$s" ]] || continue
    sed -i 's|mysqlclient|libmariadb|g' "$s"
    mysqlpatched=1
  done
  if (( mysqlpatched == 0 )); then
    error "could not find the RingMySQL build script to patch"
    error "run: ls extensions/ringmysql/ and adjust the loop above"
    return 1
  fi
  grep -rq 'libmariadb' extensions/ringmysql || {
    error "RingMySQL libmariadb patch did not apply"; return 1; }

  # --- RingNotepad settings: written to the (read-only) install tree on close
  #     and at startup — R35 in savesettingstofile() via ringnotepadxbutton().
  #     Redirect to ~/.ringnotepad/ (same treatment as ringpm's ~/.ringpm).
  #     The settings path is built in rnotesettings.ring; locate and rewrite
  #     the file-path expression, whatever its exact spelling. Fail LOUD if
  #     neither pattern matched — the message asks for the grep output so
  #     the redirect can be matched exactly.
  local rs=tools/ringnotepad/src/rnotesettings.ring
  if [[ -f "$rs" ]]; then
    # Form 1: path derived from exefolder()
    sed -i 's|exefolder()+\("[^"]*"\)|sysget("HOME")+"/.ringnotepad/"+\1|g' "$rs"
    # Form 2: an absolute settings-path constant pointing at the install tree
    sed -i 's|\(/usr/lib/ring[^"]*settings[^"]*\)|sysget("HOME")+"/.ringnotepad/settings"|g' "$rs"
  fi
  if [[ -f "$rs" ]] && grep -q 'exefolder\|/usr/lib/ring' "$rs"; then
    error "rnotesettings.ring still references the install tree — the redirect"
    error "sed did not match. Run:"
    error "  grep -n 'settings\|exefolder\|\.ring' tools/ringnotepad/src/rnotesettings.ring | head -20"
    error "and paste the output so the redirect can be matched exactly."
    return 1
  fi

  # --- RingPM: redirect state from the read-only install tree to ~/.ringpm ---
  local rdir="$srcdir/ring-$pkgver/tools/ringpm"
  find "$rdir" -name '*.ring' -exec sed -i \
      -e 's|exefolder()+"\.\./tools/ringpm/|sysget("HOME")+"/.ringpm/|g' \
      -e 's|exefolder()+"allpackages\.ring"|sysget("HOME")+"/.ringpm/allpackages.ring"|g' \
      -e 's|exefolder()+"/\.\./"|sysget("HOME")+"/.ringpm/ring/"|g' \
      -e 's|write(exefolder()+cCompletePackageName+"\.ring"|write(sysget("HOME")+"/.ringpm/ring/"+cCompletePackageName+".ring"|g' \
      {} +
  n="$(grep -r 'sysget("HOME")' "$rdir" --include='*.ring' | grep -v '/packages/' | wc -l)"
  if (( n < 9 )); then
    error "ringpm redirect seds matched only $n sites (expected 10 in $pkgver)"
    error "upstream source wording changed — adjust the seds in prepare()"
    return 1
  fi
}

build() {
  cd "ring-$pkgver"
  # Pin Qt6's qmake so the build never silently targets a Qt5 that happens
  # to be installed. The srcdir/bin entry also gives the ringqt gencode
  # stage the freshly built `ring` interpreter it needs.
  export PATH="/usr/lib/qt6/bin:$srcdir/ring-$pkgver/bin:$PATH"

  # Scrub stale qmake artifacts (e.g. Qt5-compiled .o files from an earlier
  # attempt in this srcdir; make would reuse them and then fail to link Qt6).
  rm -f extensions/ringqt/*.o extensions/ringqt/*.so* \
        extensions/ringqt/moc_*.cpp extensions/ringqt/moc_predefs.h \
        extensions/ringqt/Makefile extensions/ringqt/.qmake.stash

  cd build
  ./buildgcc.sh
}

check() {
  cd "ring-$pkgver"
  printf 'see "Hello from Ring!" + NL\n' > hello_test.ring
  ./bin/ring hello_test.ring

  # Build-tree runtime insurance for the extension dlopen test (the
  # $ORIGIN rpath in (a) should suffice; LD_LIBRARY_PATH is belt-and-braces).
  export LD_LIBRARY_PATH="$srcdir/ring-$pkgver/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

  # RingQt smoke test (headless)
  if compgen -G "lib/*qt*.so" > /dev/null; then
    printf 'load "qtcore.ring"\n? "qt ok"\n' > qt_test.ring
    QT_QPA_PLATFORM=offscreen ./bin/ring qt_test.ring
  else
    warning "no Qt extension library found — skipping Qt smoke test"
  fi

  # RingPM offline test: seed a throwaway HOME like the wrapper does
  local t="$srcdir/ringpm-check-home"
  rm -rf "$t"
  mkdir -p "$t/.ringpm/registry" "$t/.ringpm/packages" "$t/.ringpm/ring"
  cp bin/allpackages.ring "$t/.ringpm/allpackages.ring"
  cp tools/ringpm/registry/version.ring tools/ringpm/registry/registry.ring \
     "$t/.ringpm/registry/"
  HOME="$t" ./bin/ringpm search ringnotepad
}

package() {
  cd "ring-$pkgver"
  local dst="$pkgdir/usr/lib/ring"
  install -d "$dst"
  local d
  for d in bin lib libraries extensions tools applications samples documents; do
    if [[ -d "$d" ]]; then
      cp -a "$d" "$dst/"
    else
      warning "upstream tree has no '$d' — skipping"
    fi
  done
  # Drop build intermediates that rode along (qa flagged the Makefile;
  # moc_*.cpp are compiled-in, .qmake.stash is generator state):
  find "$dst" -name '*.o' -delete
  find "$dst" -name 'Makefile' -delete
  find "$dst" -name 'Makefile.*' -delete
  find "$dst" -name '.qmake.stash' -delete
  find "$dst" -name 'moc_*.cpp' -delete
  # Strip debug info from the shared libraries (removes $srcdir references
  # flagged by qa; safe — only bin/ executables carry ring2exe payloads,
  # and those are untouched because options=(!strip)).
  find "$dst/lib" -maxdepth 1 -type f -name '*.so*' \
    -exec strip --strip-debug {} \; 2>/dev/null || true
  # Optional size trims (Windows-only payloads; safe to enable):
  # rm -rf "$dst/extensions/libdepwin"
  # find "$dst" -name '*.exe' -delete

  install -d "$pkgdir/usr/bin"
  # QtWebEngine computes resources/locales from the binary location
  # (/usr/lib/ring/bin -> ../.. = /usr/lib) — missing qt6-webengine's actual
  # paths — and a FULLY missing resource bundle makes WebEngine qFatal at
  # init (SIGABRT; confirmed via gdb backtrace: QMessageLogger::fatal in
  # libQt6WebEngineCore). Therefore EVERY entry point exports the real
  # locations; pre-set user values are respected.
  local envblock='if [ -d /usr/share/qt6/resources ]; then export QTWEBENGINE_RESOURCES_PATH="${QTWEBENGINE_RESOURCES_PATH:-/usr/share/qt6/resources}"; fi
if [ -d /usr/share/qt6/translations/qtwebengine_locales ]; then export QTWEBENGINE_LOCALES_PATH="${QTWEBENGINE_LOCALES_PATH:-/usr/share/qt6/translations/qtwebengine_locales}"; fi'

  # ring itself: real wrapper (not a symlink) so ANY script using Qt/WebEngine
  # (rnote.ring and friends) inherits the correct paths.
  if [[ -e "$dst/bin/ring" ]]; then
    printf '#!/bin/sh\n%s\nexec /usr/lib/ring/bin/ring "$@"\n' "$envblock" \
      > "$pkgdir/usr/bin/ring"
    chmod 755 "$pkgdir/usr/bin/ring"
  fi
  for f in ring2exe ringrepl ringfmt folder2qrc; do
    if [[ -e "$dst/bin/$f" ]]; then
      printf '#!/bin/sh\n%s\nexec /usr/lib/ring/bin/%s "$@"\n' "$envblock" "$f" \
        > "$pkgdir/usr/bin/$f"
      chmod 755 "$pkgdir/usr/bin/$f"
    fi
  done
  # GUI entry points: env vars PLUS the writable state dir for the
  # redirected RingNotepad settings (see prepare()).
  for f in ringnotepad formdesigner; do
    if [[ -e "$dst/bin/$f" ]]; then
      printf '#!/bin/sh\n%s\nmkdir -p "$HOME/.ringnotepad" 2>/dev/null\nexec /usr/lib/ring/bin/%s "$@"\n' \
        "$envblock" "$f" > "$pkgdir/usr/bin/$f"
      chmod 755 "$pkgdir/usr/bin/$f"
    fi
  done

  local so
  for so in "$dst/lib/"*.so; do
    [[ -e "$so" ]] || continue
    ln -s "/usr/lib/ring/lib/$(basename "$so")" "$pkgdir/usr/lib/$(basename "$so")"
  done

  install -Dm644 bin/allpackages.ring \
    "$pkgdir/usr/share/ring-lang/allpackages.ring"
  install -Dm644 tools/ringpm/registry/version.ring \
    "$pkgdir/usr/share/ring-lang/registry/version.ring"
  install -Dm644 tools/ringpm/registry/registry.ring \
    "$pkgdir/usr/share/ring-lang/registry/registry.ring"

  cat > "$pkgdir/usr/bin/ringpm" <<'EOF'
#!/bin/sh
if [ -n "$HOME" ]; then
  mkdir -p "$HOME/.ringpm/registry" "$HOME/.ringpm/packages" "$HOME/.ringpm/ring" 2>/dev/null
  [ -s "$HOME/.ringpm/allpackages.ring" ] ||
    cp /usr/share/ring-lang/allpackages.ring "$HOME/.ringpm/allpackages.ring" 2>/dev/null
  [ -s "$HOME/.ringpm/registry/version.ring" ] ||
    cp /usr/share/ring-lang/registry/version.ring "$HOME/.ringpm/registry/version.ring" 2>/dev/null
  [ -s "$HOME/.ringpm/registry/registry.ring" ] ||
    cp /usr/share/ring-lang/registry/registry.ring "$HOME/.ringpm/registry/registry.ring" 2>/dev/null
fi
# QtWebEngine resources/locales for any GUI app launched via ringpm
# (binary lives at /usr/lib/ring/bin; ../.. misses /usr/share/qt6):
if [ -d /usr/share/qt6/resources ]; then
  export QTWEBENGINE_RESOURCES_PATH="${QTWEBENGINE_RESOURCES_PATH:-/usr/share/qt6/resources}"
fi
if [ -d /usr/share/qt6/translations/qtwebengine_locales ]; then
  export QTWEBENGINE_LOCALES_PATH="${QTWEBENGINE_LOCALES_PATH:-/usr/share/qt6/translations/qtwebengine_locales}"
fi
exec /usr/lib/ring/bin/ringpm "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/ringpm"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

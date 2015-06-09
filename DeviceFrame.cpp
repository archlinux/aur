#ifdef _MSC_VER
#pragma warning(disable : 4786)
#endif


#include <set>
#include <string>
#include <vector>
#include "Commands.h"
#include "DeviceFrame.h"
#include "SoundEffectFrame.h"
#include "StreamFrame.h"
#include "wxPlayer.h"

#if wxCHECK_VERSION(2,5,3)
#include "wx/generic/numdlgg.h"
#endif

template<typename T>
std::string Join(
  T cont,
  const std::string& joiner,
  const std::string& prefix = "")
{
  std::string result;

  typename T::iterator i = cont.begin();
  for (;;) {
    result += prefix + *i++;
    if (i == cont.end()) {
      break;
    } else {
      result += joiner;
    }
  }

  return result;
}


BEGIN_EVENT_TABLE(DeviceFrame, wxMDIParentFrame)
  EVT_MENU(DEVICE_NEW_DEVICE,           DeviceFrame::OnDeviceNewDevice)
  EVT_MENU(DEVICE_NEW_CDDEVICE,         DeviceFrame::OnDeviceNewCDDevice)
  EVT_MENU(DEVICE_NEW_MIDIDEVICE,       DeviceFrame::OnDeviceNewMIDIDevice)
  EVT_MENU(DEVICE_OPEN_STREAM,          DeviceFrame::OnDeviceOpenStream)
  EVT_MENU(DEVICE_OPEN_SOUND,           DeviceFrame::OnDeviceOpenSound)
  EVT_MENU(DEVICE_CREATE_TONE,          DeviceFrame::OnDeviceCreateTone)
  EVT_MENU(DEVICE_CREATE_SQUARE_WAVE,   DeviceFrame::OnDeviceCreateSquareWave)
  EVT_MENU(DEVICE_CREATE_WHITE_NOISE,   DeviceFrame::OnDeviceCreateWhiteNoise)
  EVT_MENU(DEVICE_CREATE_PINK_NOISE,    DeviceFrame::OnDeviceCreatePinkNoise)
  EVT_MENU(DEVICE_OPEN_SINGLE_EFFECT,   DeviceFrame::OnDeviceOpenSingleEffect)
  EVT_MENU(DEVICE_OPEN_MULTIPLE_EFFECT, DeviceFrame::OnDeviceOpenMultipleEffect)
  EVT_MENU(DEVICE_CLOSE_WINDOW,         DeviceFrame::OnDeviceCloseCurrentWindow)
  EVT_MENU(DEVICE_CLOSE,                DeviceFrame::OnDeviceClose)
  EVT_MENU(HELP_ABOUT,                  DeviceFrame::OnHelpAbout)
END_EVENT_TABLE()


DeviceFrame::DeviceFrame(audiere::AudioDevicePtr device)
: wxMDIParentFrame(0, -1, wxT("Audio Device - " + CStr2wxString( device->getName() )),
                   wxDefaultPosition, wxSize(400, 500))
{
  m_device = device;

  wxMenu* deviceMenu = new wxMenu();
  deviceMenu->Append(DEVICE_NEW_DEVICE,           wxT("&New Device..."));
  deviceMenu->Append(DEVICE_NEW_CDDEVICE,         wxT("New C&D Device..."));
  deviceMenu->Append(DEVICE_NEW_MIDIDEVICE,       wxT("New &MIDI Device..."));
  deviceMenu->AppendSeparator();
  deviceMenu->Append(DEVICE_OPEN_STREAM,          wxT("&Open Stream..."));
  deviceMenu->Append(DEVICE_OPEN_SOUND,           wxT("Open &Sound..."));
  deviceMenu->AppendSeparator();
  deviceMenu->Append(DEVICE_CREATE_TONE,          wxT("Create &Tone..."));
  deviceMenu->Append(DEVICE_CREATE_SQUARE_WAVE,   wxT("Create S&quare Wave..."));
  deviceMenu->Append(DEVICE_CREATE_WHITE_NOISE,   wxT("Create &White Noise"));
  deviceMenu->Append(DEVICE_CREATE_PINK_NOISE,    wxT("Create &Pink Noise"));
  deviceMenu->AppendSeparator();
  deviceMenu->Append(DEVICE_OPEN_SINGLE_EFFECT,   wxT("Open &Effect (Single)..."));
  deviceMenu->Append(DEVICE_OPEN_MULTIPLE_EFFECT, wxT("Open Effect (&Multiple)..."));
  deviceMenu->AppendSeparator();
  deviceMenu->Append(DEVICE_CLOSE_WINDOW,         wxT("Close C&urrent Window"));
  deviceMenu->Append(DEVICE_CLOSE,                wxT("&Close Device"));

  wxMenu* helpMenu = new wxMenu();
  helpMenu->Append(HELP_ABOUT, wxT("&About..."));

  wxMenuBar* menuBar = new wxMenuBar();
  menuBar->Append(deviceMenu, wxT("&Device"));
  menuBar->Append(helpMenu,   wxT("&Help"));
  SetMenuBar(menuBar);

  SetFocus();
}


void DeviceFrame::OnDeviceNewDevice(wxCommandEvent&) {
  wxGetApp().OnNewDevice(this);
}


void DeviceFrame::OnDeviceNewCDDevice(wxCommandEvent&) {
  wxGetApp().OnNewCDDevice(this);
}


void DeviceFrame::OnDeviceNewMIDIDevice(wxCommandEvent&) {
  wxGetApp().OnNewMIDIDevice(this);
}


wxString DeviceFrame::GetSoundFile() {
  std::vector<audiere::FileFormatDesc> formats;
  audiere::GetSupportedFileFormats(formats);

  // combine all of the supported extensions into one collection
  std::set<std::string> all_extensions;
  {
    for (unsigned i = 0; i < formats.size(); ++i) {
      for (unsigned j = 0; j < formats[i].extensions.size(); ++j) {
        all_extensions.insert("*." + formats[i].extensions[j]);
      }
    }
  }

  // build a string of wildcards for wxWindows
  std::string wildcards;
  wildcards = "Sound Files (" + Join(all_extensions, ",") + ")|";
  wildcards += Join(all_extensions, ";") + "|";

  {
    for (unsigned i = 0; i < formats.size(); ++i) {
      audiere::FileFormatDesc& ffd = formats[i];
      wildcards += ffd.description + " ";
      wildcards += "(" + Join(ffd.extensions, ",", "*.") + ")|";
      wildcards += Join(ffd.extensions, ";", "*.") + "|";
    }
  }

  wildcards += "All Files (*.*)|*.*";

  return wxFileSelector(
    wxT("Select a sound file"), wxT(""), wxT(""), wxT(""),
    CStr2wxString(wildcards.c_str()), wxOPEN, this);
}


void DeviceFrame::OnDeviceOpenStream(wxCommandEvent &) {
  wxString filename(GetSoundFile());
  if (filename.empty()) {
    return;
  }

#if wxUSE_UNICODE
  wxCharBuffer buffFilename = filename.mb_str(wxConvUTF8);
  audiere::SampleSourcePtr source = audiere::OpenSampleSource(buffFilename.data());
#else
  audiere::SampleSourcePtr source = audiere::OpenSampleSource(filename);
#endif
  if (!source) {
    wxMessageBox(
      wxT("Could not open sample source: ") + filename,
      wxT("Open Stream"), wxOK | wxCENTRE, this);
    return;
  }

  audiere::LoopPointSourcePtr loop_source =
    audiere::CreateLoopPointSource(source);
  if (loop_source) {
    source = loop_source.get();
  }

  audiere::OutputStreamPtr stream = audiere::OpenSound(
    m_device,
    source,
    true);
  if (!stream) {
    wxMessageBox(
      wxT("Could not open output stream: ") + filename,
      wxT("Open Stream"), wxOK | wxCENTRE, this);
    return;
  }

  // get the basename of the path for the window title
  wxString basename = wxFileNameFromPath(filename);
  new StreamFrame(this, wxT("Stream: ") + basename, stream.get(), source.get(), loop_source.get());
}


void DeviceFrame::OnDeviceOpenSound(wxCommandEvent &) {
  wxString filename(GetSoundFile());
  if (filename.empty()) {
	return;
  }

  audiere::SampleSourcePtr source = audiere::OpenSampleSource(wxString2CStr(filename));
  if (!source) {
    wxMessageBox(
      wxT("Could not open source: ") + filename,
      wxT("Open Sound"), wxOK | wxCENTRE, this);
    return;
  }

  audiere::OutputStreamPtr stream = audiere::OpenSound(m_device, source);
  if (!stream) {
    wxMessageBox(
      wxT("Could not open sound: ") + filename,
      wxT("Open Sound"), wxOK | wxCENTRE, this);
    return;
  }

  // get the basename of the path for the window title
  wxString basename = wxFileNameFromPath(filename);
  new StreamFrame(this, wxT("Sound: ") + basename, stream.get(), source.get());
}


void DeviceFrame::OnDeviceCreateTone(wxCommandEvent &) {
  int frequency = ::wxGetNumberFromUser(
    wxT("Value must be between 1 and 30000."), wxT("Enter frequency in Hz"),
    wxT("Create Tone"), 256, 1, 30000, this);
  if (frequency != -1) {
    audiere::SampleSourcePtr source = audiere::CreateTone(frequency);
    if (!source) {
      wxMessageBox(
        wxT("Could not create tone"),
        wxT("Create Tone"), wxOK | wxCENTRE, this);
      return;
    }

    audiere::OutputStreamPtr stream = m_device->openStream(source.get());
    if (!stream) {
      wxMessageBox(
        wxT("Could not open output stream"),
        wxT("Create Tone"), wxOK | wxCENTRE, this);
      return;

    }

    wxString title;
    title.sprintf(wxT("Tone: %d Hz"), frequency);
    new StreamFrame(this, title, stream.get(), source.get());
  }
}


void DeviceFrame::OnDeviceCreateSquareWave(wxCommandEvent &) {
  int frequency = ::wxGetNumberFromUser(
    wxT("Value must be between 1 and 30000."), wxT("Enter frequency in Hz"),
    wxT("Create Square Wave"), 256, 1, 30000, this);
  if (frequency != -1) {
    audiere::SampleSourcePtr source = audiere::CreateSquareWave(frequency);
    if (!source) {
      wxMessageBox(
        wxT("Could not create square wave"),
        wxT("Create Square Wave"), wxOK | wxCENTRE, this);
      return;
    }

    audiere::OutputStreamPtr stream = m_device->openStream(source.get());
    if (!stream) {
      wxMessageBox(
        wxT("Could not open output stream"),
        wxT("Create Square Wave"), wxOK | wxCENTRE, this);
      return;
    }

    wxString title;
    title.sprintf(wxT("Square Wave: %d Hz"), frequency);
    new StreamFrame(this, title, stream.get(), source.get());
  }
}


void DeviceFrame::OnDeviceCreateWhiteNoise(wxCommandEvent &) {
  audiere::SampleSourcePtr source = audiere::CreateWhiteNoise();
  if (!source) {
    wxMessageBox(
      wxT("Could not create white noise"),
      wxT("Create White Noise"), wxOK | wxCENTRE, this);
    return;
  }

  audiere::OutputStreamPtr stream = m_device->openStream(source.get());
  if (!stream) {
    wxMessageBox(
      wxT("Could not open output stream"),
      wxT("Create White Noise"), wxOK | wxCENTRE, this);
    return;
  }

  new StreamFrame(this, wxT("White Noise"), stream.get(), source.get());
}


void DeviceFrame::OnDeviceCreatePinkNoise(wxCommandEvent &) {
  audiere::SampleSourcePtr source = audiere::CreatePinkNoise();
  if (!source) {
    wxMessageBox(
      wxT("Could not create white noise"),
      wxT("Create Pink Noise"), wxOK | wxCENTRE, this);
    return;
  }

  audiere::OutputStreamPtr stream = m_device->openStream(source.get());
  if (!stream) {
    wxMessageBox(
      wxT("Could not open output stream"),
      wxT("Create Pink Noise"), wxOK | wxCENTRE, this);
    return;
  }

  new StreamFrame(this, wxT("Pink Noise"), stream.get(), source.get());
}


void DeviceFrame::OnDeviceOpenSingleEffect(wxCommandEvent &) {
  DoOpenEffect(audiere::SINGLE, wxT("Single"));
}


void DeviceFrame::OnDeviceOpenMultipleEffect(wxCommandEvent &) {
  DoOpenEffect(audiere::MULTIPLE, wxT("Multiple"));
}


void DeviceFrame::DoOpenEffect(audiere::SoundEffectType type, wxString typestring) {
  wxString filename(GetSoundFile());
  if (filename.empty()) {
    return;
  }

  audiere::SoundEffectPtr effect = audiere::OpenSoundEffect(m_device, wxString2CStr(filename), type);
  if (effect) {
    wxString basename = wxFileNameFromPath(filename);
    wxString title;
    title.sprintf(wxT("Sound Effect (%s): %s"),
                  typestring.c_str(), basename.c_str());
    new SoundEffectFrame(this, title, effect);
  } else {
    wxMessageBox(
      wxT("Could not open sound effect: ") + filename,
      wxT("Open Sound Effect"), wxOK | wxCENTRE, this);
  }
}


void DeviceFrame::OnDeviceCloseCurrentWindow(wxCommandEvent&) {
  wxMDIChildFrame* frame = GetActiveChild();
  if (frame) {
    frame->Close();
  }
}


void DeviceFrame::OnDeviceClose(wxCommandEvent &) {
  Close();
}


void DeviceFrame::OnHelpAbout(wxCommandEvent &) {
  wxGetApp().ShowAboutDialog(this);
}

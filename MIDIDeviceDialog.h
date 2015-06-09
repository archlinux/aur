#ifndef ADR_MIDI_DEVICE_DIALOG_H
#define ADR_MIDI_DEVICE_DIALOG_H


#include <string>
#include "wx.h"


class MIDIDeviceDialog : public wxDialog {
public:
  MIDIDeviceDialog(wxWindow* parent);

  const std::string& getName() const {
    return m_name_str;
  }

private:
  void OnButton(wxCommandEvent& event);

  wxTextCtrl* m_name;

  wxButton* m_ok;
  wxButton* m_cancel;

  std::string m_name_str;

  DECLARE_EVENT_TABLE()
};


#endif

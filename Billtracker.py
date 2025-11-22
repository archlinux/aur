#!/usr/bin/env python3
__version__ = '1.1.0'
import gi
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')
from gi.repository import Gtk, Adw, GLib, Gdk

import sys
import json
import os
from datetime import datetime, date
import threading
import webbrowser
import urllib.request
import urllib.error
from gi.repository import GLib

# Centralized dictionary for all user-facing strings
STRINGS = {
    "app_title": "Bill & Savings Tracker",
    "budget_group_title": "Set Your Budget",
    "budget_row_title": "Budget Amount",
    "set_budget_button": "Set Budget",
    "add_bill_group_title": "Add a New Bill",
    "bill_name_row": "Bill Name",
    "amount_row": "Amount",
    "due_date_row": "Due Date",
    "add_bill_button": "Add Bill",
    "summarize_in_label": "Summarize in:",
    "total_unpaid_label": "Total of Unpaid Bills:",
    "budget_after_paying_label": "Budget After Paying Bills:",
    "actions_group_title": "Actions",
    "converter_button": "Converter",
    "clear_data_button": "Clear Data",
    "donate_button": "Donate",
    "refresh_rates_button": "Refresh Rates",
    "settings_button": "Settings",
    "unpaid_bills_title": "Unpaid Bills",
    "sort_name_button": "Name",
    "sort_date_button": "Date",
    "sort_amount_button": "Amount",
    "paid_bills_title": "Paid Bills",
    "credits_label": "made with <3 by Grouvya!",
    "pay_button": "Pay",
    "due_on_label": "Due:",
    "no_date_label": "No Date",
    "edit_bill_title": "Edit Bill",
    "bill_name_label": "Bill Name",
    "amount_label": "Amount",
    "currency_label": "Currency",
    "due_date_label": "Due Date",
    "save_changes_button": "Save Changes",
    "converter_title": "Currency Converter",
    "from_label": "From",
    "to_label": "To",
    "convert_button": "Convert",
    "settings_title": "Settings",
    "api_key_group_title": "ExchangeRate-API Key",
    "api_instructions": "To get real-time currency rates, sign up for the free plan on exchangerate-api.com, find the API key in your dashboard, and paste it below.",
    "api_key_row_title": "ExchangeRate-API Key",
    "save_key_button": "Save Key",
    "data_file_group_title": "Data File Location",
    "browse_button": "Browse...",
    "dialog_input_error": "Input Error",
    "error_enter_name_amount": "Please enter both name and amount.",
    "error_positive_amount": "Please enter a valid positive amount.",
    "error_no_exchange_rate": "Could not find exchange rate.",
    "error_valid_number": "Please enter a valid number for the budget.",
    "info_budget_set": "Budget Set",
    "info_budget_set_to": "Budget set to {}",
    "info_api_key_saved": "API Key Saved",
    "info_api_key_saved_msg": "Your API key has been saved successfully!",
    "info_path_saved": "Path Saved",
    "info_path_saved_msg": "Data file path has been updated.",
    "info_data_cleared": "Data Cleared",
    "info_data_cleared_msg": "All data has been cleared.",
    "dialog_confirm_payment": "Confirm Payment",
    "confirm_payment_msg": "Are you sure you want to pay '{}'?",
    "dialog_confirm_delete": "Confirm Delete",
    "confirm_delete_msg": "Are you sure you want to delete '{}'?",
    "dialog_clear_data": "Clear All Data",
    "confirm_clear_data_msg": "Are you sure you want to delete all bills and reset your budget?",
    "invalid_input": "Invalid Input",
    "api_key_missing": "API key missing. Go to Settings.",
    "api_error": "API error. Using cached rates.",
    "network_error": "Network error. Using cached rates.",
    "rates_updated_at": "Live rates updated: {}",
}

# -- Data and API Management Classes --

# Mapping of ISO currency codes to human-readable currency names.
# This is used by the currency selector to show friendly names.
CURRENCY_FULL_NAMES = {
    'AFN': 'Afghan Afghani', 'ALL': 'Albanian Lek', 'AMD': 'Armenian Dram', 'ANG': 'Netherlands Antillean Guilder',
    'AOA': 'Angolan Kwanza', 'ARS': 'Argentine Peso', 'AUD': 'Australian Dollar', 'AWG': 'Aruban Florin',
    'AZN': 'Azerbaijani Manat', 'BAM': 'Bosnia-Herzegovina Convertible Mark', 'BBD': 'Barbadian Dollar', 'BDT': 'Bangladeshi Taka',
    'BGN': 'Bulgarian Lev', 'BHD': 'Bahraini Dinar', 'BIF': 'Burundian Franc', 'BMD': 'Bermudian Dollar',
    'BND': 'Brunei Dollar', 'BOB': 'Bolivian Boliviano', 'BRL': 'Brazilian Real', 'BSD': 'Bahamian Dollar',
    'BTN': 'Bhutanese Ngultrum', 'BWP': 'Botswana Pula', 'BYN': 'Belarusian Ruble', 'BZD': 'Belize Dollar',
    'CAD': 'Canadian Dollar', 'CDF': 'Congolese Franc', 'CHF': 'Swiss Franc', 'CLP': 'Chilean Peso',
    'CNY': 'Chinese Yuan', 'COP': 'Colombian Peso', 'CRC': 'Costa Rican Colón', 'CUP': 'Cuban Peso',
    'CVE': 'Cape Verdean Escudo', 'CZK': 'Czech Koruna', 'DJF': 'Djiboutian Franc', 'DKK': 'Danish Krone',
    'DOP': 'Dominican Peso', 'DZD': 'Algerian Dinar', 'EGP': 'Egyptian Pound', 'ERN': 'Eritrean Nakfa',
    'ETB': 'Ethiopian Birr', 'EUR': 'Euro', 'FJD': 'Fijian Dollar', 'FKP': 'Falkland Islands Pound',
    'GBP': 'British Pound Sterling', 'GEL': 'Georgian Lari', 'GHS': 'Ghanaian Cedi', 'GIP': 'Gibraltar Pound',
    'GMD': 'Gambian Dalasi', 'GNF': 'Guinean Franc', 'GTQ': 'Guatemalan Quetzal', 'GYD': 'Guyanese Dollar',
    'HKD': 'Hong Kong Dollar', 'HNL': 'Honduran Lempira', 'HRK': 'Croatian Kuna', 'HTG': 'Haitian Gourde',
    'HUF': 'Hungarian Forint', 'IDR': 'Indonesian Rupiah', 'ILS': 'Israeli New Shekel', 'INR': 'Indian Rupee',
    'IQD': 'Iraqi Dinar', 'IRR': 'Iranian Rial', 'ISK': 'Icelandic Króna', 'JEP': 'Jersey Pound',
    'JMD': 'Jamaican Dollar', 'JOD': 'Jordanian Dinar', 'JPY': 'Japanese Yen', 'KES': 'Kenyan Shilling',
    'KGS': 'Kyrgyzstani Som', 'KHR': 'Cambodian Riel', 'KMF': 'Comorian Franc', 'KPW': 'North Korean Won',
    'KRW': 'South Korean Won', 'KWD': 'Kuwaiti Dinar', 'KYD': 'Cayman Islands Dollar', 'KZT': 'Kazakhstani Tenge',
    'LAK': 'Lao Kip', 'LBP': 'Lebanese Pound', 'LKR': 'Sri Lankan Rupee', 'LRD': 'Liberian Dollar',
    'LSL': 'Lesotho Loti', 'LTL': 'Lithuanian Litas (historic)', 'LVL': 'Latvian Lats (historic)', 'LYD': 'Libyan Dinar',
    'MAD': 'Moroccan Dirham', 'MDL': 'Moldovan Leu', 'MGA': 'Malagasy Ariary', 'MKD': 'Macedonian Denar',
    'MMK': 'Myanmar Kyat', 'MNT': 'Mongolian Tögrög', 'MOP': 'Macanese Pataca', 'MRO': 'Mauritanian Ouguiya (historic)',
    'MUR': 'Mauritian Rupee', 'MVR': 'Maldivian Rufiyaa', 'MWK': 'Malawian Kwacha', 'MXN': 'Mexican Peso',
    'MYR': 'Malaysian Ringgit', 'MZN': 'Mozambican Metical', 'NAD': 'Namibian Dollar', 'NGN': 'Nigerian Naira',
    'NIO': 'Nicaraguan Córdoba', 'NOK': 'Norwegian Krone', 'NPR': 'Nepalese Rupee', 'NZD': 'New Zealand Dollar',
    'OMR': 'Omani Rial', 'PAB': 'Panamanian Balboa', 'PEN': 'Peruvian Sol', 'PGK': 'Papua New Guinean Kina',
    'PHP': 'Philippine Peso', 'PKR': 'Pakistani Rupee', 'PLN': 'Polish Złoty', 'PYG': 'Paraguayan Guaraní',
    'QAR': 'Qatari Riyal', 'RON': 'Romanian Leu', 'RSD': 'Serbian Dinar', 'RUB': 'Russian Ruble',
    'RWF': 'Rwandan Franc', 'SAR': 'Saudi Riyal', 'SBD': 'Solomon Islands Dollar', 'SCR': 'Seychellois Rupee',
    'SDG': 'Sudanese Pound', 'SEK': 'Swedish Krona', 'SGD': 'Singapore Dollar', 'SHP': 'Saint Helena Pound',
    'SLL': 'Sierra Leonean Leone', 'SOS': 'Somali Shilling', 'SRD': 'Surinamese Dollar', 'STD': 'Sao Tome Dobra (historic)',
    'SVC': 'Salvadoran Colón', 'SYP': 'Syrian Pound', 'SZL': 'Swazi Lilangeni', 'THB': 'Thai Baht',
    'TJS': 'Tajikistani Somoni', 'TMT': 'Turkmenistan Manat', 'TND': 'Tunisian Dinar', 'TOP': 'Tongan Paʻanga',
    'TRY': 'Turkish Lira', 'TTD': 'Trinidad and Tobago Dollar', 'TWD': 'New Taiwan Dollar', 'TZS': 'Tanzanian Shilling',
    'UAH': 'Ukrainian Hryvnia', 'UGX': 'Ugandan Shilling', 'USD': 'United States Dollar', 'UYU': 'Uruguayan Peso',
    'UZS': 'Uzbekistan Som', 'VEF': 'Venezuelan Bolívar (historic)', 'VND': 'Vietnamese Đồng', 'VUV': 'Vanuatu Vatu',
    'WST': 'Samoan Tala', 'XAF': 'Central African CFA Franc', 'XCD': 'East Caribbean Dollar', 'XOF': 'West African CFA Franc',
    'XPF': 'CFP Franc', 'YER': 'Yemeni Rial', 'ZAR': 'South African Rand', 'ZMW': 'Zambian Kwacha', 'ZWL': 'Zimbabwean Dollar'
}


class DataManager:
    """Handles loading and saving of config and application data."""
    def __init__(self, config_dir):
        self.config_dir = config_dir
        self.config_file = os.path.join(self.config_dir, 'config.json')
        self.data_file = os.path.join(self.config_dir, 'bill_data.json') # Default data file
        os.makedirs(self.config_dir, exist_ok=True)

    def load_config(self):
        """Loads the app configuration."""
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r', encoding='utf-8') as f:
                    config = json.load(f)
                    self.data_file = config.get('data_file_path', self.data_file)
                    return config
            except (json.JSONDecodeError, IOError):
                return {}
        return {}

    def save_config(self, config_data):
        """Saves the app configuration."""
        try:
            with open(self.config_file, 'w', encoding='utf-8') as f:
                json.dump(config_data, f, indent=4)
        except IOError as e:
            print(f"Error saving config: {e}")

    def load_data(self):
        """Loads all bill and budget data."""
        if os.path.exists(self.data_file):
            try:
                with open(self.data_file, 'r', encoding='utf-8') as f:
                    return json.load(f)
            except (json.JSONDecodeError, IOError, ValueError) as e:
                self.show_error_dialog("Error", f"Could not read data file: {e}")
                return {}
        return {}

    def save_data(self, data_to_save):
        """Saves all bill and budget data."""
        try:
            with open(self.data_file, 'w', encoding='utf-8') as f:
                json.dump(data_to_save, f, indent=4, ensure_ascii=False)
        except IOError as e:
            self.show_error_dialog("Error", f"Could not write to data file: {e}")

    def save_rates_cache(self, rates_data):
        """Persist last-successful rates response to disk."""
        try:
            cache_file = os.path.join(self.config_dir, 'rates_cache.json')
            with open(cache_file, 'w', encoding='utf-8') as f:
                json.dump(rates_data, f, indent=2)
        except IOError:
            # non-fatal; ignore write failures
            pass

    def load_rates_cache(self):
        """Load cached rates if available, else return None."""
        try:
            cache_file = os.path.join(self.config_dir, 'rates_cache.json')
            if os.path.exists(cache_file):
                with open(cache_file, 'r', encoding='utf-8') as f:
                    return json.load(f)
        except (IOError, json.JSONDecodeError):
            return None
        return None

    def show_error_dialog(self, title, message):
        dialog = Gtk.MessageDialog(
            transient_for=None, modal=True, message_type=Gtk.MessageType.ERROR,
            buttons=Gtk.ButtonsType.OK, text=title,
            secondary_text=message
        )
        dialog.connect("response", lambda d, r: d.destroy())
        dialog.present()


class APIManager:
    """Handles all external API calls for exchange rates."""
    def __init__(self, result_callback):
        self.result_callback = result_callback

    def fetch_rates_async(self):
        """Fetches exchange rates in a background thread."""
        thread = threading.Thread(target=self._execute_fetch)
        thread.daemon = True
        thread.start()

    def _execute_fetch(self):
        # Use exchangerate.host (free, open-source) which does not require an API key.
        # Docs: https://exchangerate.host
        primary_url = "https://api.exchangerate.host/latest?base=USD"
        fallback_url = "https://open.er-api.com/v6/latest/USD"
        try:
            with urllib.request.urlopen(primary_url, timeout=10) as response:
                if response.status != 200:
                    raise urllib.error.HTTPError(primary_url, response.status, "HTTP Status not 200", response.headers, response)
                content = response.read().decode('utf-8')
                data = json.loads(content)
                # Primary provider usually returns a 'rates' mapping. If it's missing (e.g. provider requires key), try fallback.
                if 'rates' in data and isinstance(data['rates'], dict) and data['rates']:
                    normalized = {'conversion_rates': data['rates'], 'base_code': data.get('base', 'USD'), 'timestamp': data.get('timestamp')}
                    GLib.idle_add(self.result_callback, {'status': 'success', 'data': normalized})
                    return
                # Try fallback provider which also returns 'rates'
        except urllib.error.HTTPError:
            # continue to try fallback
            pass
        except urllib.error.URLError:
            # network issues; report network error (UI will fall back to cache)
            GLib.idle_add(self.result_callback, {'status': 'error', 'message': STRINGS["network_error"]})
            return
        except json.JSONDecodeError:
            # malformed primary response; try fallback
            pass

        # Fallback attempt
        try:
            with urllib.request.urlopen(fallback_url, timeout=10) as response:
                if response.status != 200:
                    raise urllib.error.HTTPError(fallback_url, response.status, "HTTP Status not 200", response.headers, response)
                content = response.read().decode('utf-8')
                data = json.loads(content)
                if 'rates' in data and isinstance(data['rates'], dict) and data['rates']:
                    # normalize to expected shape
                    normalized = {'conversion_rates': data['rates'], 'base_code': data.get('base_code', 'USD'), 'timestamp': data.get('time_last_update_unix')}
                    GLib.idle_add(self.result_callback, {'status': 'success', 'data': normalized})
                    return
                else:
                    GLib.idle_add(self.result_callback, {'status': 'error', 'message': STRINGS["api_error"]})
        except urllib.error.HTTPError as e:
            GLib.idle_add(self.result_callback, {'status': 'error', 'message': f"API HTTP error: {e.code}"})
        except urllib.error.URLError:
            GLib.idle_add(self.result_callback, {'status': 'error', 'message': STRINGS["network_error"]})
        except json.JSONDecodeError:
            GLib.idle_add(self.result_callback, {'status': 'error', 'message': STRINGS["api_error"]})


# -- GTK Windows --

class BillEditorWindow(Gtk.Window):
    def __init__(self, parent, bill, currencies, save_callback):
        super().__init__(transient_for=parent, modal=True)
        self.bill = bill
        self.currencies = currencies
        self.save_callback = save_callback

        self.set_title(STRINGS["edit_bill_title"])
        self.set_default_size(350, 400)
        self.set_resizable(False)

        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=15, margin_top=15, margin_bottom=15, margin_start=15, margin_end=15)
        self.set_child(main_box)

        main_box.append(Gtk.Label(label=f'<b>{STRINGS["bill_name_label"]}</b>', use_markup=True, xalign=0))
        self.name_entry = Gtk.Entry(text=bill['name'])
        main_box.append(self.name_entry)

        main_box.append(Gtk.Label(label=f'<b>{STRINGS["amount_label"]}</b>', use_markup=True, xalign=0))
        self.amount_entry = Gtk.Entry(text=str(bill['amount']))
        main_box.append(self.amount_entry)

        main_box.append(Gtk.Label(label=f'<b>{STRINGS["currency_label"]}</b>', use_markup=True, xalign=0))
        self.currency_dropdown = Gtk.DropDown.new_from_strings(list(self.currencies.keys()))
        try:
            currency_index = list(self.currencies.keys()).index(bill['currency'])
            self.currency_dropdown.set_selected(currency_index)
        except ValueError:
            self.currency_dropdown.set_selected(0)
        # add a small search button next to the dropdown
        cur_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        cur_box.append(self.currency_dropdown)
        cur_search = Gtk.Button()
        cur_search.add_css_class('flat')
        cur_search.set_icon_name('system-search-symbolic')
        cur_search.connect('clicked', lambda b: self.open_currency_selector())
        cur_box.append(cur_search)
        main_box.append(cur_box)

        main_box.append(Gtk.Label(label=f'<b>{STRINGS["due_date_label"]}</b>', use_markup=True, xalign=0))
        # Gtk.Calendar is not available/consistent across GTK4 installs; use a plain Entry for due date
        self.date_entry = Gtk.Entry(text=bill.get('due_date', date.today().strftime('%Y-%m-%d')))
        self.date_entry.set_hexpand(True)
        main_box.append(self.date_entry)

        save_button = Gtk.Button(label=STRINGS["save_changes_button"])
        save_button.add_css_class("suggested-action")
        save_button.set_margin_top(10)
        save_button.connect("clicked", self.on_save_clicked)
        main_box.append(save_button)
        
    # Date selection using simple Entry; popover/calendar removed for GTK4 compatibility

    def on_save_clicked(self, button):
        new_name = self.name_entry.get_text().strip()
        new_amount_str = self.amount_entry.get_text()
        if not new_name or not new_amount_str:
            self.show_error(STRINGS["error_enter_name_amount"])
            return
        try:
            new_amount = float(new_amount_str)
            if new_amount <= 0: raise ValueError
        except ValueError:
            self.show_error(STRINGS["error_positive_amount"])
            return
        updated_bill = self.bill.copy()
        updated_bill['name'] = new_name
        updated_bill['amount'] = new_amount
        # DropDown returns an index via get_selected(); look up the string from the currencies list
        sel_idx = self.currency_dropdown.get_selected()
        try:
            updated_bill['currency'] = list(self.currencies.keys())[sel_idx]
        except Exception:
            updated_bill['currency'] = list(self.currencies.keys())[0]
        updated_bill['due_date'] = self.date_entry.get_text()
        self.save_callback(self.bill, updated_bill)
        self.destroy()

    def open_currency_selector(self):
        def on_selected(display_string):
            try:
                idx = list(self.currencies.keys()).index(display_string)
                self.currency_dropdown.set_selected(idx)
            except ValueError:
                pass
        sel = CurrencySelectorWindow(self, list(self.currencies.keys()), on_selected)
        sel.present()

    def show_error(self, message):
        dialog = Gtk.MessageDialog(
            transient_for=self, modal=True, message_type=Gtk.MessageType.ERROR,
            buttons=Gtk.ButtonsType.OK, text=STRINGS["dialog_input_error"],
            secondary_text=message
        )
        dialog.connect("response", lambda d, r: d.destroy())
        dialog.present()


class ConverterWindow(Gtk.Window):
    def __init__(self, parent, currencies, exchange_rates):
        super().__init__(transient_for=parent, modal=True)
        self.currencies = currencies
        self.exchange_rates = exchange_rates

        self.set_title(STRINGS["converter_title"])
        self.set_default_size(350, 400)
        self.set_resizable(False)

        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=15, margin_top=15, margin_bottom=15, margin_start=15, margin_end=15)
        self.set_child(main_box)

        main_box.append(Gtk.Label(label=f'<b>{STRINGS["amount_label"]}</b>', use_markup=True, xalign=0))
        self.amount_entry = Gtk.Entry(placeholder_text="100.00")
        main_box.append(self.amount_entry)
        
        main_box.append(Gtk.Label(label=f'<b>{STRINGS["from_label"]}</b>', use_markup=True, xalign=0))
        # keep an ordered list for index lookups
        self.currency_list = list(self.currencies.keys())
        self.from_dropdown = Gtk.DropDown.new_from_strings(self.currency_list)
        try:
            self.from_dropdown.set_selected(self.currency_list.index('$ (USD)'))
        except ValueError:
            self.from_dropdown.set_selected(0)
        # add search button next to dropdown
        from_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        from_box.append(self.from_dropdown)
        from_search = Gtk.Button()
        from_search.add_css_class('flat')
        from_search.set_icon_name('system-search-symbolic')
        from_search.connect('clicked', lambda b: self.open_currency_selector(self.from_dropdown))
        from_box.append(from_search)
        main_box.append(from_box)

        main_box.append(Gtk.Label(label=f'<b>{STRINGS["to_label"]}</b>', use_markup=True, xalign=0))
        self.to_dropdown = Gtk.DropDown.new_from_strings(self.currency_list)
        try:
            self.to_dropdown.set_selected(self.currency_list.index('€ (EUR)'))
        except ValueError:
            self.to_dropdown.set_selected(0)
        to_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        to_box.append(self.to_dropdown)
        to_search = Gtk.Button()
        to_search.add_css_class('flat')
        to_search.set_icon_name('system-search-symbolic')
        to_search.connect('clicked', lambda b: self.open_currency_selector(self.to_dropdown))
        to_box.append(to_search)
        main_box.append(to_box)

        self.result_label = Gtk.Label(label="")
        self.result_label.add_css_class("title-1")
        main_box.append(self.result_label)
        
        convert_button = Gtk.Button(label=STRINGS["convert_button"])
        convert_button.add_css_class("suggested-action")
        convert_button.set_margin_top(10)
        convert_button.connect("clicked", self.perform_conversion)
        main_box.append(convert_button)
        # Close button for converter window
        close_btn = Gtk.Button(label="Close")
        close_btn.connect('clicked', lambda b: self.destroy())
        main_box.append(close_btn)
        
    def perform_conversion(self, button):
        try:
            amount = float(self.amount_entry.get_text().replace(',', ''))
            # Get selected indices and map to currency strings
            from_idx = self.from_dropdown.get_selected()
            to_idx = self.to_dropdown.get_selected()
            from_curr = self.currency_list[from_idx] if from_idx is not None and from_idx >= 0 else self.currency_list[0]
            to_curr = self.currency_list[to_idx] if to_idx is not None and to_idx >= 0 else self.currency_list[0]

            from_rate_vs_usd = self.exchange_rates.get(from_curr)
            to_rate_vs_usd = self.exchange_rates.get(to_curr)

            if not from_rate_vs_usd or not to_rate_vs_usd:
                raise KeyError

            amount_in_usd = amount / from_rate_vs_usd
            converted_amount = amount_in_usd * to_rate_vs_usd

            to_symbol = self.currencies.get(to_curr, "")
            self.result_label.set_text(f"{to_symbol}{converted_amount:,.2f}")
        except (ValueError, KeyError):
            self.result_label.set_text(STRINGS["invalid_input"])

    def open_currency_selector(self, dropdown_widget):
        """Open searchable selector and set the provided DropDown when chosen."""
        def on_selected(display_string):
            try:
                idx = self.currency_list.index(display_string)
                dropdown_widget.set_selected(idx)
            except ValueError:
                pass
        sel = CurrencySelectorWindow(self, self.currency_list, on_selected)
        sel.present()


class SettingsWindow(Adw.PreferencesWindow):
    def __init__(self, parent):
        super().__init__(transient_for=parent, modal=True)
        self.main_window = parent
        
        self.set_title(STRINGS["settings_title"])
        self.set_default_size(500, 450)
        
        page = Adw.PreferencesPage()
        self.add(page)

        # API key settings removed: app uses exchangerate.host (no API key required)

        # --- Data File Group ---
        data_group = Adw.PreferencesGroup(title=STRINGS["data_file_group_title"])
        page.add(data_group)

        path_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        self.path_entry = Gtk.Entry(text=parent.data_manager.data_file, editable=False, hexpand=True)
        path_box.append(self.path_entry)
        browse_button = Gtk.Button(label=STRINGS["browse_button"])
        browse_button.connect("clicked", self.on_browse_clicked)
        path_box.append(browse_button)

        path_row = Adw.ActionRow(child=path_box)
        data_group.add(path_row)

    # API key saved handler removed (not needed)

    def on_browse_clicked(self, button):
        dialog = Gtk.FileChooserDialog(
            title="Choose a data file location",
            transient_for=self,
            action=Gtk.FileChooserAction.SAVE,
        )
        dialog.add_buttons("_Cancel", Gtk.ResponseType.CANCEL, "_Save", Gtk.ResponseType.ACCEPT)
        dialog.set_current_name("bill_data.json")

        def on_response(d, response_id):
            if response_id == Gtk.ResponseType.ACCEPT:
                file = d.get_file()
                new_path = file.get_path()
                self.path_entry.set_text(new_path)
                self.main_window.data_manager.data_file = new_path
                config = self.main_window.data_manager.load_config()
                config['data_file_path'] = new_path
                self.main_window.data_manager.save_config(config)
                self.main_window.save_data()
                self.main_window.show_info_dialog(STRINGS["info_path_saved"], STRINGS["info_path_saved_msg"])
            d.destroy()
            
        dialog.connect("response", on_response)
        dialog.present()


# -- GTK Main Application Window --

class BillTrackerWindow(Gtk.ApplicationWindow):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.set_title(STRINGS["app_title"])
        self.set_default_size(600, 800)
        self.set_icon_name("com.github.grouvya.billtracker")

        config_dir = os.path.join(os.path.expanduser('~'), '.bill_tracker')
        self.data_manager = DataManager(config_dir)
        config = self.data_manager.load_config()
        # Initialize API manager (no API key required)
        self.api_manager = APIManager(self.handle_api_result)

        # Initialize currency lists before applying cached rates (cached handler expects them)
        self.currencies = self.get_currency_list()
        self.full_currency_list = list(self.currencies.keys())
        self.exchange_rates = {}

        # NOTE: cached rates will be loaded after widgets are created (they update UI elements)

        self.unpaid_bills = []
        self.paid_bills = []
        self.budget = 0.0
        self.load_data()

        self.create_widgets()

        # Load cached rates if available so the UI can show last-known rates while offline
        cached = self.data_manager.load_rates_cache()
        if cached and isinstance(cached, dict) and 'conversion_rates' in cached:
            # reuse the existing handler to normalize and apply cached data
            self.handle_api_result({'status': 'success', 'data': cached})

        self.api_manager.fetch_rates_async()
        # Automatically refresh rates periodically (every hour)
        self._rates_error_shown = False
        UPDATE_INTERVAL_SECONDS = 3600
        # schedule periodic fetch; wrapper must return True to continue
        GLib.timeout_add_seconds(UPDATE_INTERVAL_SECONDS, lambda: (self.api_manager.fetch_rates_async() or True))
        self.update_summary()
        self.update_bills_display()
        self.update_budget_display()

        self.connect("close-request", self.on_closing)

    def create_widgets(self):
        self.header = Adw.HeaderBar()
        self.header.set_title_widget(Adw.WindowTitle.new(STRINGS["app_title"], f"v{__version__}"))
        self.set_titlebar(self.header)
        
        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12, margin_top=12, margin_bottom=12, margin_start=12, margin_end=12)
        scrolled_window = Gtk.ScrolledWindow(child=main_box)
        scrolled_window.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)
        self.set_child(scrolled_window)

        self.budget_frame = Adw.PreferencesGroup(title=STRINGS["budget_group_title"])
        main_box.append(self.budget_frame)
        budget_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        self.budget_entry = Gtk.Entry()
        self.budget_entry.set_hexpand(True)
        budget_box.append(self.budget_entry)
        self.budget_currency_dropdown = Gtk.DropDown.new_from_strings(self.full_currency_list)
        budget_box.append(self.budget_currency_dropdown)
        # add a small search button to open a searchable selector
        search_btn = Gtk.Button()
        search_btn.add_css_class('flat')
        search_btn.set_icon_name('system-search-symbolic')
        search_btn.connect('clicked', lambda b: self.open_currency_selector(self.budget_currency_dropdown))
        budget_box.append(search_btn)
        budget_row = Adw.ActionRow(title=STRINGS["budget_row_title"], child=budget_box)
        self.budget_frame.add(budget_row)
        self.set_budget_button = Gtk.Button(label=STRINGS["set_budget_button"])
        self.set_budget_button.connect("clicked", self.set_budget)
        main_box.append(self.set_budget_button)

        self.add_bill_frame = Adw.PreferencesGroup(title=STRINGS["add_bill_group_title"])
        main_box.append(self.add_bill_frame)
        self.bill_name_entry = Adw.EntryRow(title=STRINGS["bill_name_row"])
        self.add_bill_frame.add(self.bill_name_entry)
        amount_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        self.bill_amount_entry = Gtk.Entry(hexpand=True)
        amount_box.append(self.bill_amount_entry)
        self.bill_currency_dropdown = Gtk.DropDown.new_from_strings(self.full_currency_list)
        amount_box.append(self.bill_currency_dropdown)
        bill_search_btn = Gtk.Button()
        bill_search_btn.add_css_class('flat')
        bill_search_btn.set_icon_name('system-search-symbolic')
        bill_search_btn.connect('clicked', lambda b: self.open_currency_selector(self.bill_currency_dropdown))
        amount_box.append(bill_search_btn)
        self.amount_row = Adw.ActionRow(title=STRINGS["amount_row"], child=amount_box)
        self.add_bill_frame.add(self.amount_row)
        # Use a simple Entry for due date (GTK4 may not include Gtk.Calendar on all systems)
        self.due_date_entry = Gtk.Entry(text=date.today().strftime('%Y-%m-%d'))
        self.date_row = Adw.ActionRow(title=STRINGS["due_date_row"], child=self.due_date_entry)
        self.add_bill_frame.add(self.date_row)
        self.add_bill_button = Gtk.Button(label=STRINGS["add_bill_button"])
        self.add_bill_button.add_css_class("suggested-action")
        self.add_bill_button.connect("clicked", self.add_bill)
        main_box.append(self.add_bill_button)

        summary_frame = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5, margin_top=15, margin_bottom=15)
        main_box.append(summary_frame)
        summary_currency_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6, halign=Gtk.Align.CENTER)
        summary_currency_box.append(Gtk.Label(label=STRINGS["summarize_in_label"]))
        self.summary_currency_dropdown = Gtk.DropDown.new_from_strings(self.full_currency_list)
        summary_currency_box.append(self.summary_currency_dropdown)
        summary_search_btn = Gtk.Button()
        summary_search_btn.add_css_class('flat')
        summary_search_btn.set_icon_name('system-search-symbolic')
        summary_search_btn.connect('clicked', lambda b: self.open_currency_selector(self.summary_currency_dropdown))
        summary_currency_box.append(summary_search_btn)
        summary_frame.append(summary_currency_box)
        self.total_to_pay_label = Gtk.Label()
        summary_frame.append(self.total_to_pay_label)
        self.remaining_budget_label = Gtk.Label()
        self.remaining_budget_label.add_css_class("title-2")
        summary_frame.append(self.remaining_budget_label)
        self.budget_progressbar = Gtk.ProgressBar(show_text=True)
        summary_frame.append(self.budget_progressbar)
        self.rates_status_label = Gtk.Label()
        self.rates_status_label.add_css_class("caption")
        summary_frame.append(self.rates_status_label)
        
        actions_frame = Adw.PreferencesGroup(title=STRINGS["actions_group_title"])
        main_box.append(actions_frame)
        button_box = Gtk.FlowBox(valign=Gtk.Align.START, max_children_per_line=3, min_children_per_line=2, selection_mode=Gtk.SelectionMode.NONE)
        actions_frame.add(Adw.ActionRow(child=button_box))
        
        converter_button = Gtk.Button(label=STRINGS["converter_button"])
        converter_button.connect("clicked", self.open_converter_window)
        button_box.append(converter_button)
        
        clear_data_button = Gtk.Button(label=STRINGS["clear_data_button"])
        clear_data_button.add_css_class("destructive-action")
        clear_data_button.connect("clicked", self.clear_data)
        button_box.append(clear_data_button)
        
        donate_button = Gtk.Button(label=STRINGS["donate_button"])
        donate_button.connect("clicked", self.open_donate_link)
        button_box.append(donate_button)
        
        refresh_rates_button = Gtk.Button(label=STRINGS["refresh_rates_button"])
        refresh_rates_button.connect("clicked", lambda b: self.api_manager.fetch_rates_async())
        button_box.append(refresh_rates_button)

        settings_button = Gtk.Button(label=STRINGS["settings_button"], icon_name="document-properties-symbolic")
        settings_button.connect("clicked", self.open_settings_window)
        button_box.append(settings_button)

        main_box.append(Gtk.Separator(margin_top=10, margin_bottom=10))
        unpaid_header = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6, margin_bottom=6)
        main_box.append(unpaid_header)
        unpaid_bills_label = Gtk.Label(label=f'<b>{STRINGS["unpaid_bills_title"]}</b>', use_markup=True, xalign=0, hexpand=True)
        unpaid_bills_label.add_css_class("title-2")
        unpaid_header.append(unpaid_bills_label)

        sort_box = Gtk.Box(spacing=6)
        unpaid_header.append(sort_box)
        sort_name_button = Gtk.Button(label=STRINGS["sort_name_button"])
        sort_name_button.connect("clicked", self.sort_bills_by_name)
        sort_box.append(sort_name_button)
        sort_date_button = Gtk.Button(label=STRINGS["sort_date_button"])
        sort_date_button.connect("clicked", self.sort_bills_by_date)
        sort_box.append(sort_date_button)
        sort_amount_button = Gtk.Button(label=STRINGS["sort_amount_button"])
        sort_amount_button.connect("clicked", self.sort_bills_by_amount)
        sort_box.append(sort_amount_button)

        self.unpaid_bills_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        main_box.append(self.unpaid_bills_box)
        
        main_box.append(Gtk.Separator(margin_top=10, margin_bottom=10))
        paid_bills_label = Gtk.Label(label=f'<b>{STRINGS["paid_bills_title"]}</b>', use_markup=True, xalign=0)
        paid_bills_label.add_css_class("title-2")
        main_box.append(paid_bills_label)
        self.paid_bills_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        main_box.append(self.paid_bills_box)

        credits_link = Gtk.LinkButton(uri="https://guns.lol/grouvya", label=STRINGS["credits_label"], halign=Gtk.Align.CENTER)
        main_box.append(credits_link)
        # Show version below credits
        version_label = Gtk.Label(label=f"Version: {__version__}", halign=Gtk.Align.CENTER)
        version_label.add_css_class("caption")
        main_box.append(version_label)

        # Use notify on the 'selected' property and map indices to strings when reading
        self.budget_currency_dropdown.connect("notify::selected", self.update_budget_display)
        self.summary_currency_dropdown.connect("notify::selected", self.on_currency_change)
        try:
            self.budget_currency_dropdown.set_selected(self.full_currency_list.index(self.saved_budget_currency))
            self.bill_currency_dropdown.set_selected(self.full_currency_list.index(self.saved_bill_currency))
            self.summary_currency_dropdown.set_selected(self.full_currency_list.index(self.saved_summary_currency))
        except ValueError:
            pass

    def on_due_date_button_clicked(self, button):
        # No-op: date Entry is used instead of a popover/calendar in GTK4-compatible builds
        return
        
    def on_due_date_selected(self, calendar):
        # No-op placeholder for GTK4 compatibility
        return

    def open_settings_window(self, button):
        win = SettingsWindow(self)
        win.present()
        
    def open_converter_window(self, button):
        win = ConverterWindow(self, self.currencies, self.exchange_rates)
        win.present()

    def open_currency_selector(self, dropdown_widget):
        """Open the searchable currency selector and set the provided DropDown when chosen."""
        def on_selected(display_string):
            try:
                idx = self.full_currency_list.index(display_string)
                dropdown_widget.set_selected(idx)
                # trigger updates that depend on currency selection
                self.update_budget_display()
                self.update_summary()
            except ValueError:
                pass

        sel_win = CurrencySelectorWindow(self, self.full_currency_list, on_selected)
        sel_win.present()

    def open_donate_link(self, button):
        webbrowser.open_new("https://revolut.me/grouvya")

    def clear_data(self, button):
        dialog = Gtk.MessageDialog(
            transient_for=self, modal=True, message_type=Gtk.MessageType.WARNING,
            buttons=Gtk.ButtonsType.YES_NO, text=STRINGS["dialog_clear_data"],
            secondary_text=STRINGS["confirm_clear_data_msg"]
        )
        def on_response(d, response_id):
            d.destroy()
            if response_id == Gtk.ResponseType.YES:
                self.unpaid_bills, self.paid_bills, self.budget = [], [], 0.0
                self.update_budget_display()
                self.update_summary()
                self.update_bills_display()
                self.save_data()
                self.show_info_dialog(STRINGS["info_data_cleared"], STRINGS["info_data_cleared_msg"])
        dialog.connect("response", on_response)
        dialog.present()
    
    def sort_bills_by_name(self, button):
        self.unpaid_bills.sort(key=lambda b: b['name'].lower())
        self.update_bills_display()

    def sort_bills_by_date(self, button):
        self.unpaid_bills.sort(key=lambda b: datetime.strptime(b.get('due_date', '9999-12-31'), '%Y-%m-%d'))
        self.update_bills_display()

    def sort_bills_by_amount(self, button):
        def get_usd_amount(bill):
            rate = self.exchange_rates.get(bill['currency'], 1)
            return bill['amount'] / rate if rate > 0 else float('inf')
        self.unpaid_bills.sort(key=get_usd_amount, reverse=True)
        self.update_bills_display()

    def load_data(self):
        data = self.data_manager.load_data()
        self.unpaid_bills = data.get('unpaid_bills', [])
        self.paid_bills = data.get('paid_bills', [])
        self.budget = float(data.get('budget', 0.0))
        default_currency = '$ (USD)'
        self.saved_budget_currency = data.get('budget_currency', default_currency)
        self.saved_bill_currency = data.get('bill_currency', default_currency)
        self.saved_summary_currency = data.get('summary_currency', default_currency)

    def save_data(self):
        data = {
            'budget': self.budget,
            # convert selected index to currency string (DropDown provides index via get_selected())
            'budget_currency': (self.full_currency_list[self.budget_currency_dropdown.get_selected()] if self.budget_currency_dropdown.get_selected() is not None else self.full_currency_list[0]),
            'unpaid_bills': self.unpaid_bills, 'paid_bills': self.paid_bills,
            'bill_currency': (self.full_currency_list[self.bill_currency_dropdown.get_selected()] if self.bill_currency_dropdown.get_selected() is not None else self.full_currency_list[0]),
            'summary_currency': (self.full_currency_list[self.summary_currency_dropdown.get_selected()] if self.summary_currency_dropdown.get_selected() is not None else self.full_currency_list[0])
        }
        self.data_manager.save_data(data)

    def handle_api_result(self, result):
        if result['status'] == 'success':
            data = result['data']
            api_rates = data.get("conversion_rates", {})
            updated_rates = {}
            for app_currency_str in self.currencies:
                code = app_currency_str.split('(')[-1].replace(')', '').strip()
                if code in api_rates:
                    updated_rates[app_currency_str] = api_rates[code]
            updated_rates['$ (USD)'] = 1.0
            self.exchange_rates = updated_rates
            now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            self.rates_status_label.set_text(STRINGS["rates_updated_at"].format(now))
            # clear network error flag on success so future errors will show dialog
            self._rates_error_shown = False
            # persist the normalized rates payload so the app can use them offline
            try:
                # save the raw normalized data (contains 'conversion_rates', etc.)
                self.data_manager.save_rates_cache(data)
            except Exception:
                # non-fatal; ignore cache write failures
                pass
        else:
            self.rates_status_label.set_text(result['message'])
            # show a single 'no internet' dialog when network error occurs
            if result.get('message') == STRINGS["network_error"] and not getattr(self, '_rates_error_shown', False):
                self._rates_error_shown = True
                # non-blocking dialog
                self.show_error_dialog("No internet", STRINGS["network_error"])
        self.update_budget_display()
        self.update_summary()

    def set_budget(self, button=None):
        try:
            displayed_amount = float(self.budget_entry.get_text().replace(',', ''))
            # Map dropdown index to currency string
            sel = self.budget_currency_dropdown.get_selected()
            budget_curr = self.full_currency_list[sel] if sel is not None and sel >= 0 else self.full_currency_list[0]
            rate = self.exchange_rates.get(budget_curr)
            if not rate or rate <= 0:
                self.show_error_dialog('Error', STRINGS["error_no_exchange_rate"])
                return
            self.budget = displayed_amount / rate
            self.update_summary()
            formatted_amount = f"{self.currencies.get(budget_curr, '')}{displayed_amount:,.2f}"
            self.show_info_dialog(STRINGS["info_budget_set"], STRINGS["info_budget_set_to"].format(formatted_amount))
        except ValueError:
            self.show_error_dialog(STRINGS["dialog_input_error"], STRINGS["error_valid_number"])

    def add_bill(self, button=None):
        name = self.bill_name_entry.get_text().strip()
        amount_str = self.bill_amount_entry.get_text()
        # map dropdown index to currency string
        sel = self.bill_currency_dropdown.get_selected()
        currency = self.full_currency_list[sel] if sel is not None and sel >= 0 else self.full_currency_list[0]
        due_date = self.due_date_entry.get_text()
        if not name or not amount_str:
            self.show_error_dialog(STRINGS["dialog_input_error"], STRINGS["error_enter_name_amount"])
            return
        try:
            amount = float(amount_str.replace(',', ''))
            if amount <= 0: raise ValueError
        except ValueError:
            self.show_error_dialog(STRINGS["dialog_input_error"], STRINGS["error_positive_amount"])
            return
        bill = {"name": name, "amount": amount, "currency": currency, "due_date": due_date}
        self.unpaid_bills.append(bill)
        self.bill_name_entry.set_text("")
        self.bill_amount_entry.set_text("")
        self.update_summary()
        self.update_bills_display()

    def pay_bill(self, bill_to_pay):
        dialog = Gtk.MessageDialog(
            transient_for=self, modal=True, message_type=Gtk.MessageType.QUESTION,
            buttons=Gtk.ButtonsType.YES_NO, text=STRINGS["dialog_confirm_payment"],
            secondary_text=STRINGS["confirm_payment_msg"].format(bill_to_pay['name'])
        )
        def on_response(d, response_id):
            d.destroy()
            if response_id == Gtk.ResponseType.YES:
                rate_vs_usd = self.exchange_rates.get(bill_to_pay['currency'])
                if rate_vs_usd and rate_vs_usd > 0:
                    self.budget -= bill_to_pay['amount'] / rate_vs_usd
                    self.update_budget_display()
                self.unpaid_bills.remove(bill_to_pay)
                self.paid_bills.append(bill_to_pay)
                self.update_summary()
                self.update_bills_display()
        dialog.connect("response", on_response)
        dialog.present()

    def delete_bill(self, bill_to_delete):
        dialog = Gtk.MessageDialog(
            transient_for=self, modal=True, message_type=Gtk.MessageType.WARNING,
            buttons=Gtk.ButtonsType.YES_NO, text=STRINGS["dialog_confirm_delete"],
            secondary_text=STRINGS["confirm_delete_msg"].format(bill_to_delete['name'])
        )
        def on_response(d, response_id):
            d.destroy()
            if response_id == Gtk.ResponseType.YES:
                if bill_to_delete in self.unpaid_bills: self.unpaid_bills.remove(bill_to_delete)
                elif bill_to_delete in self.paid_bills: self.paid_bills.remove(bill_to_delete)
                self.update_summary()
                self.update_bills_display()
        dialog.connect("response", on_response)
        dialog.present()

    def edit_bill(self, bill_to_edit):
        editor = BillEditorWindow(self, bill_to_edit, self.currencies, self.handle_bill_edited)
        editor.present()

    def handle_bill_edited(self, original_bill, updated_bill):
        try:
            index = self.unpaid_bills.index(original_bill)
            self.unpaid_bills[index] = updated_bill
            self.update_summary()
            self.update_bills_display()
        except ValueError:
            print("Could not find original bill to update.")

    def on_currency_change(self, dropdown, param):
        self.update_summary()

    def update_budget_display(self, dropdown=None, param=None):
        sel = self.budget_currency_dropdown.get_selected()
        budget_curr = self.full_currency_list[sel] if sel is not None and sel >= 0 else self.full_currency_list[0]
        rate = self.exchange_rates.get(budget_curr)
        if rate and rate > 0:
            self.budget_entry.set_text(f"{self.budget * rate:,.2f}")
        else:
            self.budget_entry.set_text(f"{self.budget:,.2f}")

    def update_summary(self):
        sel = self.summary_currency_dropdown.get_selected()
        summary_curr_str = self.full_currency_list[sel] if sel is not None and sel >= 0 else self.full_currency_list[0]
        summary_symbol = self.currencies.get(summary_curr_str, '$')
        target_rate = self.exchange_rates.get(summary_curr_str)
        if not target_rate: return
        total_to_pay_usd = sum(b['amount'] / self.exchange_rates.get(b['currency'], 1) for b in self.unpaid_bills if self.exchange_rates.get(b['currency']))
        remaining_budget_usd = self.budget - total_to_pay_usd
        final_to_pay = total_to_pay_usd * target_rate
        remaining_budget_display = remaining_budget_usd * target_rate
        self.total_to_pay_label.set_text(f'{STRINGS["total_unpaid_label"]} {summary_symbol}{final_to_pay:,.2f}')
        self.remaining_budget_label.set_text(f'{STRINGS["budget_after_paying_label"]} {summary_symbol}{remaining_budget_display:,.2f}')
        for css_class in ["success", "warning", "error"]:
             self.budget_progressbar.remove_css_class(css_class)
             self.remaining_budget_label.remove_css_class(css_class)
        if self.budget > 0:
            percentage = (remaining_budget_usd / self.budget)
            self.budget_progressbar.set_fraction(max(0, percentage))
            self.budget_progressbar.set_text(f"{max(0, percentage):.0%}")
            if percentage < 0.25:
                self.budget_progressbar.add_css_class("error")
                self.remaining_budget_label.add_css_class("error")
            elif percentage < 0.50:
                self.budget_progressbar.add_css_class("warning")
                self.remaining_budget_label.add_css_class("warning")
            else:
                self.budget_progressbar.add_css_class("success")
                self.remaining_budget_label.add_css_class("success")
        else:
            self.budget_progressbar.set_fraction(0)
            self.budget_progressbar.set_text("0%")

    def update_bills_display(self):
        for box in [self.unpaid_bills_box, self.paid_bills_box]:
            child = box.get_first_child()
            while child:
                box.remove(child)
                child = box.get_first_child()
        for bill in self.unpaid_bills:
            symbol = self.currencies.get(bill['currency'], '$')
            due_date_str = bill.get('due_date', STRINGS["no_date_label"])
            row = Adw.ActionRow(title=bill['name'], subtitle=f'{symbol}{bill["amount"]:.2f} — {STRINGS["due_on_label"]} {due_date_str}')
            try:
                due_date_obj = datetime.strptime(due_date_str, '%Y-%m-%d').date()
                if due_date_obj < date.today(): row.add_css_class("error")
            except (ValueError, TypeError): pass

            button_box = Gtk.Box(spacing=6)
            row.add_suffix(button_box)

            pay_button = Gtk.Button(label=STRINGS["pay_button"])
            pay_button.add_css_class("pill")
            pay_button.set_valign(Gtk.Align.CENTER)
            pay_button.connect("clicked", lambda b, bill_ref=bill: self.pay_bill(bill_ref))
            button_box.append(pay_button)

            edit_button = Gtk.Button(icon_name="document-edit-symbolic")
            edit_button.connect("clicked", lambda b, bill_ref=bill: self.edit_bill(bill_ref))
            button_box.append(edit_button)

            delete_button = Gtk.Button(icon_name="user-trash-symbolic")
            delete_button.add_css_class("destructive-action")
            delete_button.connect("clicked", lambda b, bill_ref=bill: self.delete_bill(bill_ref))
            button_box.append(delete_button)
            
            self.unpaid_bills_box.append(row)
        for bill in self.paid_bills:
            symbol = self.currencies.get(bill['currency'], '$')
            row = Adw.ActionRow(title=bill['name'], subtitle=f"{symbol}{bill['amount']:.2f}", activatable=False)
            row.add_css_class("dim-label")
            self.paid_bills_box.append(row)
    
    def on_closing(self, window):
        self.save_data()
        return False

    def show_error_dialog(self, title, message):
        dialog = Gtk.MessageDialog(
            transient_for=self, modal=True, message_type=Gtk.MessageType.ERROR,
            buttons=Gtk.ButtonsType.OK, text=title, secondary_text=message
        )
        dialog.connect("response", lambda d, r: d.destroy())
        dialog.present()

    def show_info_dialog(self, title, message):
        dialog = Gtk.MessageDialog(
            transient_for=self, modal=True, message_type=Gtk.MessageType.INFO,
            buttons=Gtk.ButtonsType.OK, text=title, secondary_text=message
        )
        dialog.connect("response", lambda d, r: d.destroy())
        dialog.present()

    def get_currency_list(self):
            # Provide currency descriptions derived from the code and symbol so the selector can show more info.
            return { '؋ (AFN)': '؋', 'Lek (ALL)': 'Lek', 'դր. (AMD)': 'դր.', 'ƒ (ANG)': 'ƒ', 'Kz (AOA)': 'Kz', '$ (ARS)': '$', 'A$ (AUD)': 'A$', 'ƒ (AWG)': 'ƒ', '₼ (AZN)': '₼', 'KM (BAM)': 'KM', '$ (BBD)': '$', '৳ (BDT)': '৳', 'лв (BGN)': 'лв', '.د.ب (BHD)': '.د.ب', 'FBu (BIF)': 'FBu', '$ (BMD)': '$', '$ (BND)': '$', 'Bs. (BOB)': 'Bs.', 'R$ (BRL)': 'R$', '$ (BSD)': '$', 'Nu. (BTN)': 'Nu.', 'P (BWP)': 'P', 'Br (BYN)': 'Br', '$ (BZD)': '$', 'C$ (CAD)': 'C$', 'Fr (CDF)': 'Fr', 'Fr (CHF)': 'Fr', '$ (CLP)': '$', '¥ (CNY)': '¥', '$ (COP)': '$', '₡ (CRC)': '₡', '$ (CUP)': 'CUP', '$ (CVE)': '$', 'Kč (CZK)': 'Kč', 'Fdj (DJF)': 'Fdj', 'kr (DKK)': 'kr', 'RD$ (DOP)': 'RD$', 'DA (DZD)': 'DA', 'E£ (EGP)': 'E£', 'Nfk (ERN)': 'Nfk', 'Br (ETB)': 'Br', '€ (EUR)': '€', '$ (FJD)': '$', '£ (FKP)': '£', '£ (GBP)': '£', '₾ (GEL)': '₾', '£ (GGP)': '£', 'GH₵ (GHS)': 'GH₵', '£ (GIP)': '£', 'D (GMD)': 'D', 'Fr (GNF)': 'Fr', 'Q (GTQ)': 'Q', '$ (GYD)': '$', 'HK$ (HKD)': 'HK$', 'L (HNL)': 'L', 'kn (HRK)': 'kn', 'G (HTG)': 'G', 'Ft (HUF)': 'Ft', 'Rp (IDR)': 'Rp', '₪ (ILS)': '₪', '£ (IMP)': '£', '₹ (INR)': '₹', 'ع.د (IQD)': 'ع.د', '﷼ (IRR)': '﷼', 'kr (ISK)': 'kr', '£ (JEP)': '£', '$ (JMD)': '$', 'JD (JOD)': 'JD', '¥ (JPY)': '¥', 'KSh (KES)': 'KSh', 'лв (KGS)': 'лв', '៛ (KHR)': '៛', 'Fr (KMF)': 'Fr', '₩ (KPW)': '₩', '₩ (KRW)': '₩', 'KD (KWD)': 'KD', '$ (KYD)': '$', '〒 (KZT)': '〒', '₭ (LAK)': '₭', 'ل.ل (LBP)': 'ل.ل', '₨ (LKR)': '₨', '$ (LRD)': '$', 'L (LSL)': 'L', 'LTL (LTL)': 'LTL', 'Ls (LVL)': 'Ls', 'ل.د (LYD)': 'ل.د', 'د.م. (MAD)': 'د.მ.', 'L (MDL)': 'L', 'Ar (MGA)': 'Ar', 'ден (MKD)': 'ден', 'K (MMK)': 'K', '₮ (MNT)': '₮', 'P (MOP)': 'P', 'UM (MRO)': 'UM', '₨ (MUR)': '₨', 'Rf (MVR)': 'Rf', 'MK (MWK)': 'MK', '$ (MXN)': '$', 'RM (MYR)': 'RM', 'MTn (MZN)': 'MTn', 'N$ (NAD)': 'N$', '₦ (NGN)': '₦', 'C$ (NIO)': 'C$', 'kr (NOK)': 'kr', '₨ (NPR)': '₨', 'NZ$ (NZD)': 'NZ$', '﷼ (OMR)': '﷼', 'B/. (PAB)': 'B/.', 'S/. (PEN)': 'S/.', 'K (PGK)': 'K', '₱ (PHP)': '₱', '₨ (PKR)': '₨', 'zł (PLN)': 'zł', '₲ (PYG)': '₲', '﷼ (QAR)': '﷼', 'lei (RON)': 'lei', 'din (RSD)': 'din', '₽ (RUB)': '₽', 'FRw (RWF)': 'FRw', '﷼ (SAR)': '﷼', '$ (SBD)': '$', '₨ (SCR)': '₨', 'ج.س. (SDG)': 'ج.س.', 'kr (SEK)': 'kr', 'S$ (SGD)': 'S$', '£ (SHP)': '£', 'Le (SLL)': 'Le', 'S (SOS)': 'S', '$ (SRD)': '$', 'Db (STD)': 'Db', '$ (SVC)': '$', '£S (SYP)': '£S', 'L (SZL)': 'L', '฿ (THB)': '฿', 'ЅМ (TJS)': 'ЅМ', 'T (TMT)': 'T', 'د.ت (TND)': 'د.ت', 'T$ (TOP)': 'T$', '₺ (TRY)': '₺', 'TT$ (TTD)': 'TT$', 'NT$ (TWD)': 'NT$', 'TSh (TZS)': 'TSh', '₴ (UAH)': '₴', 'USh (UGX)': 'USh', '$ (USD)': '$', '$U (UYU)': '$U', 'soʻm (UZS)': 'soʻm', 'Bs (VEF)': 'Bs', '₫ (VND)': '₫', 'Vt (VUV)': 'Vt', 'T (WST)': 'T', 'Fr (XAF)': 'Fr', '$ (XCD)': '$', 'Fr (XOF)': 'Fr', 'Fr (XPF)': 'Fr', '﷼ (YER)': '﷼', 'R (ZAR)': 'R', 'ZK (ZMW)': 'ZK', 'Z$ (ZWL)': 'Z$' }


def _currency_description(display_string):
    """Return a short description for a currency display string like '€ (EUR)'.
    Use the ISO code to look up the friendly currency name when available.
    """
    try:
        code = display_string.split('(')[-1].replace(')', '').strip()
        symbol = display_string.split(' ')[0]
        name = CURRENCY_FULL_NAMES.get(code)
        if name:
            return f"{code} — {symbol} — {name}"
        return f"{code} — {symbol}"
    except Exception:
        return display_string


class CurrencySelectorWindow(Gtk.Window):
    """A simple search + list window to pick a currency from the full list.
    Calls the provided callback with the selected display string.
    """
    def __init__(self, parent, full_currency_list, callback):
        super().__init__(transient_for=parent, modal=True)
        self.set_title(STRINGS.get('currency_selector_title', 'Select Currency'))
        self.set_default_size(420, 520)
        self.full_currency_list = full_currency_list
        self.callback = callback
        # mapping from ListBoxRow objects to their currency display strings
        self._row_to_currency = {}

        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6, margin_top=12, margin_bottom=12, margin_start=12, margin_end=12)
        self.set_child(main_box)

        self.search = Gtk.SearchEntry(placeholder_text="Search currencies by code, symbol or text")
        self.search.connect("search-changed", self.on_search_changed)
        main_box.append(self.search)

        # focus search when the window is mapped
        self.search.connect('map', lambda w: w.grab_focus())

        self.listbox = Gtk.ListBox()
        self.listbox.set_selection_mode(Gtk.SelectionMode.SINGLE)
        scrolled = Gtk.ScrolledWindow(child=self.listbox)
        scrolled.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)
        scrolled.set_vexpand(True)
        main_box.append(scrolled)

        # initially populate with all currencies
        self._populate_list("")
        # handle activation (double-click / Enter)
        self.listbox.connect('row-activated', self.on_row_activated)
        # handle single-click selection
        self.listbox.connect('row-selected', self.on_row_selected)

        # Close button at the bottom to dismiss the selector
        btn_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        btn_box.set_halign(Gtk.Align.END)
        close_btn = Gtk.Button(label="Close")
        close_btn.add_css_class('destructive-action')
        close_btn.connect('clicked', lambda b: self.destroy())
        btn_box.append(close_btn)
        main_box.append(btn_box)

    def on_search_changed(self, entry):
        q = entry.get_text().strip().lower()
        self._populate_list(q)

    def _populate_list(self, q):
        """Rebuild the listbox rows filtering by query q (case-insensitive)."""
        # clear existing rows in a GTK4-compatible way
        child = self.listbox.get_first_child()
        while child is not None:
            next_child = child.get_next_sibling()
            # also remove mapping for the row if present
            try:
                if child in self._row_to_currency:
                    del self._row_to_currency[child]
            except Exception:
                pass
            self.listbox.remove(child)
            child = next_child
        # clear mapping to be safe
        self._row_to_currency.clear()
        # append matching rows
        for s in self.full_currency_list:
            text = s.lower()
            code = s.split('(')[-1].replace(')', '').strip().lower()
            symbol = s.split(' ')[0].lower()
            name = CURRENCY_FULL_NAMES.get(code, '').lower()
            if q == '' or q in text or q in code or q in symbol or (name and q in name):
                row = Gtk.ListBoxRow()
                h = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2, margin_top=6, margin_bottom=6, margin_start=6, margin_end=6)
                title = Gtk.Label(label=s, xalign=0)
                subtitle = Gtk.Label(label=_currency_description(s), xalign=0)
                subtitle.add_css_class('caption')
                h.append(title)
                h.append(subtitle)
                row.set_child(h)
                self.listbox.append(row)
                # remember which currency this row represents
                try:
                    self._row_to_currency[row] = s
                except Exception:
                    pass

    def on_row_activated(self, listbox, row):
        # activated (double-click or Enter) -> resolve via mapping
        sel = self._row_to_currency.get(row)
        if sel:
            self.callback(sel)
            self.destroy()

    def on_row_selected(self, listbox, row):
        # single-click selection should also select the currency immediately
        if row is None:
            return
        sel = self._row_to_currency.get(row)
        if sel:
            self.callback(sel)
            self.destroy()


# -- Application Class to manage the lifecycle --

class MyApp(Adw.Application):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.connect('activate', self.on_activate)

    def on_activate(self, app):
        self.win = BillTrackerWindow(application=app)
        self.win.present()

if __name__ == "__main__":
    app = MyApp(application_id="com.github.grouvya.billtracker")
    try:
        app.run(sys.argv)
    except Exception as e:
        import traceback, sys as _sys
        traceback.print_exc()
        # Print a concise message for users running from terminal
        print(f"Billtracker crashed: {e}", file=_sys.stderr)